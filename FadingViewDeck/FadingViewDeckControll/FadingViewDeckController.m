//
//  FadingViewDeckController.m
//  FadingViewDeck
//
//  Created by Kireto on 4/24/14.
//  Copyright (c) 2014 No Name. All rights reserved.
//

#import "FadingViewDeckController.h"

#define max_velocity 200.0

@interface FadingViewDeckController ()

@property (nonatomic,assign) CGFloat panPercentage;
@property (nonatomic,assign) CGPoint touchOffset;
@property (nonatomic,assign) BOOL isMenuVisible;
@property (nonatomic,assign) FadingViewDeckControllerPanDirection panDirection;
@property (nonatomic,strong) UIPanGestureRecognizer *panGesture;

@end

@implementation FadingViewDeckController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithMainViewController:(UIViewController*)mainController
              menuViewController:(UIViewController*)menuController
{
    self = [super init];
    if (self) {
        // Custom initialization
        _mainController = mainController;
        _menuController = menuController;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:20.0/255.0 green:38.0/255.0 blue:42.0/255.0 alpha:1.0];
    self.navigationController.navigationBarHidden = YES;
    _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    _isMenuVisible = NO;
    [self setupView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - setupView
- (void)setupView {
    
    if (_mainController) {
        [_mainController.view setFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height)];
        _mainController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:_mainController.view];
        
        if (_menuController) {
            [_menuController.view setFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height)];
            _menuController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            [self.view insertSubview:_menuController.view belowSubview:_mainController.view];
            _menuController.view.alpha = 0.0;
        }
    }
}

#pragma mark - public methods
- (void)setMainViewController:(UIViewController*)mainController animated:(BOOL)animated {
    
    self.view.userInteractionEnabled = NO;
    [self setMainViewController:mainController];
    [self hideMenuView];
}

- (void)setMainViewController:(UIViewController*)mainController {
    
    if (_mainController) {
        [_mainController.view removeFromSuperview];
        _mainController = nil;
    }
    _mainController = mainController;
    [_mainController.view setFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height)];
    _mainController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    if (_menuController) {
        [self.view insertSubview:_mainController.view belowSubview:_menuController.view];
    }
    else {
        [self.view addSubview:_mainController.view];
    }
}

- (void)setupMenuButtonForController:(UIViewController*)controller {
    
	UIBarButtonItem *menuBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menuIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(showMenuView)];
	controller.navigationItem.leftBarButtonItem = menuBarButton;
}

- (void)setupCloseButtonForController:(UIViewController*)controller {
    
	UIBarButtonItem *menuBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"closeIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(hideMenuView)];
	controller.navigationItem.leftBarButtonItem = menuBarButton;
}

- (void)removePanGessture {
    [self.view removeGestureRecognizer:_panGesture];
}

- (void)addPanGessture {
    [self.view removeGestureRecognizer:_panGesture];//avoid the posibillity of adding the gesture recognizer twice
    [self.view addGestureRecognizer:_panGesture];
}

#pragma mark - button selectors
- (void)showHideMenuView {
    
    if (_menuController) {
        [self.view bringSubviewToFront:_menuController.view];
    }
    CGFloat targetAlpha = 1.0;
    if (_isMenuVisible) {
        targetAlpha = 0.0;
    }
    _isMenuVisible = !_isMenuVisible;
    [UIView animateWithDuration:0.2f
                     animations:^{
                         [_menuController.view setAlpha:targetAlpha];
                     }
                     completion:^(BOOL finished) {
                         
                         if (finished) {
                             
                         }
                         if (!_isMenuVisible) {
                             [self.view sendSubviewToBack:_menuController.view];
                         }
                         self.view.userInteractionEnabled = YES;
                     }];
}

- (void)showMenuView {
    _isMenuVisible = NO;
    [self showHideMenuView];
}

- (void)hideMenuView {
    _isMenuVisible = YES;
    [self showHideMenuView];
}

#pragma mark - pan gesture
- (void)handlePanGesture:(UIPanGestureRecognizer*)panGesture {
    
    CGPoint location = [panGesture locationInView:self.view];
    
    if (panGesture.state == UIGestureRecognizerStateBegan) {
        
        _touchOffset = location;
        
        if (_menuController) {
            [self.view bringSubviewToFront:_menuController.view];
        }
        if (_isMenuVisible) {
            _panDirection = FadingViewDeckControllerPanLeft;
        }
        else {
            _panDirection = FadingViewDeckControllerPanRight;
        }
    }
    else if (panGesture.state == UIGestureRecognizerStateCancelled || panGesture.state == UIGestureRecognizerStateEnded) {
        [self panningEnded];
    }
    else {
        
        CGFloat panVelocity = location.x - _touchOffset.x;
        CGFloat panPercentage = panVelocity/max_velocity;
        if (_panDirection == FadingViewDeckControllerPanLeft) {
            panPercentage += 1.0;
        }
        if (panPercentage > 1.0) {
            panPercentage = 1.0;
        }
        else if (panPercentage < 0.0) {
            panPercentage = 0.0;
        }
        [self panPercentageChanged:panPercentage];
    }
}

- (void)panPercentageChanged:(CGFloat)panPercentage {
    
    if (panPercentage > 1.0) {
        panPercentage = 1.0;
    }
    else if (panPercentage < 0.0) {
        panPercentage = 0.0;
    }
    [_menuController.view setAlpha:panPercentage];
    _panPercentage = panPercentage;
}

- (void)panningEnded {
    
    if (_panPercentage > 0.5) {
        [self showMenuView];
    }
    else {
        [self hideMenuView];
    }
}

@end
