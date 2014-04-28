//
//  FadingMenuViewController.m
//  FadingViewDeck
//
//  Created by Kireto on 4/24/14.
//  Copyright (c) 2014 No Name. All rights reserved.
//

#import "FadingMenuViewController.h"

#import "UINavigationController+CustomRotation.h"

#import "Globals.h"
#import "AppDelegate.h"

#import "FadingViewDeckController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"

@interface FadingMenuViewController ()

@property (nonatomic,strong) NSArray *tableNames;

@end

@implementation FadingMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"menuBg"]];
    self.title = NSLocalizedString(@"Menu", @"Menu");
    
    //first row is empty
	_tableNames = [NSArray arrayWithObjects:@"First Option", @"Second Option", @"Third Option", @"Fourth Option", @"Fifth Option", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[AppDelegate instance].fadingViewDeckController setupCloseButtonForController:self];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
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

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_tableNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIView *separatorView;
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.textColor = [UIColor colorWithWhite:1.0 alpha:0.9];
		cell.textLabel.font = [UIFont fontWithName:@"Avenir-Medium" size:17];
        
        separatorView = [[UIView alloc] initWithFrame:CGRectMake(0.0, cell.contentView.frame.size.height - 1.0, cell.contentView.frame.size.width, 1.0)];
        separatorView.backgroundColor = [UIColor colorWithRed:80.0/255.0 green:80.0/255.0 blue:80.0/255.0 alpha:1.0];
        [cell.contentView addSubview:separatorView];
    }
    cell.textLabel.text = @"";
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if ([_tableNames count] > indexPath.row) {
        cell.textLabel.text = [_tableNames objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
            if ([Globals selectedMainControllerType] == MainControllerTypeFirst) {
                [[AppDelegate instance].fadingViewDeckController showHideMenuView];
            }
            else {
                [self setFirstController:YES];
            }
            break;
        case 1:
            if ([Globals selectedMainControllerType] == MainControllerTypeSecond) {
                [[AppDelegate instance].fadingViewDeckController showHideMenuView];
            }
            else {
                [self setSecondController:YES];
            }
            break;
        case 2:
            if ([Globals selectedMainControllerType] == MainControllerTypeThird) {
                [[AppDelegate instance].fadingViewDeckController showHideMenuView];
            }
            else {
                [self setThirdController:YES];
            }
            break;
        case 3:
            if ([Globals selectedMainControllerType] == MainControllerTypeFourth) {
                [[AppDelegate instance].fadingViewDeckController showHideMenuView];
            }
            else {
                [self setFourthController:YES];
            }
            break;
        case 4:
            if ([Globals selectedMainControllerType] == MainControllerTypeFifth) {
                [[AppDelegate instance].fadingViewDeckController showHideMenuView];
            }
            else {
                [self setFifthController:YES];
            }
            break;
        default:
            break;
    }
}

#pragma mark - set new main controller
- (void)setFirstController:(BOOL)animated {
    if (!_firstNC) {
        _firstVC = [[FirstViewController alloc] init];
        _firstNC = [[UINavigationController alloc] initWithRootViewController:_firstVC];
	}
    [Globals selectMainControllerType:MainControllerTypeFirst];
    [[AppDelegate instance].fadingViewDeckController setMainViewController:_firstNC animated:YES];
    
    [self removeSecondScreen];
    [self removeThirdScreen];
    [self removeFourthScreen];
    [self removeFifthScreen];
}

- (void)setSecondController:(BOOL)animated {
    if (!_secondNC) {
        _secondVC = [[SecondViewController alloc] init];
        _secondNC = [[UINavigationController alloc] initWithRootViewController:_secondVC];
	}
    [Globals selectMainControllerType:MainControllerTypeSecond];
    [[AppDelegate instance].fadingViewDeckController setMainViewController:_secondNC animated:YES];
    
    [self removeFirstScreen];
    [self removeThirdScreen];
    [self removeFourthScreen];
    [self removeFifthScreen];
}

- (void)setThirdController:(BOOL)animated {
    if (!_thirdNC) {
        _thirdVC = [[ThirdViewController alloc] init];
        _thirdNC = [[UINavigationController alloc] initWithRootViewController:_thirdVC];
	}
    [Globals selectMainControllerType:MainControllerTypeThird];
    [[AppDelegate instance].fadingViewDeckController setMainViewController:_thirdNC animated:YES];
    
    [self removeFirstScreen];
    [self removeSecondScreen];
    [self removeFourthScreen];
    [self removeFifthScreen];
}

- (void)setFourthController:(BOOL)animated {
    if (!_fourthNC) {
        _fourthVC = [[FourthViewController alloc] init];
        _fourthNC = [[UINavigationController alloc] initWithRootViewController:_fourthVC];
	}
    [Globals selectMainControllerType:MainControllerTypeFourth];
    [[AppDelegate instance].fadingViewDeckController setMainViewController:_fourthNC animated:YES];
    
    [self removeFirstScreen];
    [self removeSecondScreen];
    [self removeThirdScreen];
    [self removeFifthScreen];
}

- (void)setFifthController:(BOOL)animated {
    if (!_fifthNC) {
        _fifthVC = [[FifthViewController alloc] init];
        _fifthNC = [[UINavigationController alloc] initWithRootViewController:_fifthVC];
	}
    [Globals selectMainControllerType:MainControllerTypeFifth];
    [[AppDelegate instance].fadingViewDeckController setMainViewController:_fifthNC animated:YES];
    
    [self removeFirstScreen];
    [self removeSecondScreen];
    [self removeThirdScreen];
    [self removeFourthScreen];
}

#pragma mark - clear live screens
- (void)removeFirstScreen {
    if (_firstNC) {
        [_firstNC.view removeFromSuperview];
        _firstNC = nil;
        _firstVC = nil;
    }
}

- (void)removeSecondScreen {
    if (_secondNC) {
        [_secondNC.view removeFromSuperview];
        _secondNC = nil;
        _secondVC = nil;
    }
}

- (void)removeThirdScreen {
    if (_thirdNC) {
        [_thirdNC.view removeFromSuperview];
        _thirdNC = nil;
        _thirdVC = nil;
    }
}

- (void)removeFourthScreen {
    if (_fourthNC) {
        [_fourthNC.view removeFromSuperview];
        _fourthNC = nil;
        _fourthVC = nil;
    }
}

- (void)removeFifthScreen {
    if (_fifthNC) {
        [_fifthNC.view removeFromSuperview];
        _fifthNC = nil;
        _fifthVC = nil;
    }
}

@end
