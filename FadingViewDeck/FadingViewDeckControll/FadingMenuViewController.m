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

#import "FadingMenuNavigationController.h"
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
    [[AppDelegate instance].fadingMenuNavController setupCloseButtonForController:self];
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
                [[AppDelegate instance].fadingMenuNavController showHideMenuView];
            }
            else {
                [self setFirstController:YES];
            }
            break;
        case 1:
            if ([Globals selectedMainControllerType] == MainControllerTypeSecond) {
                [[AppDelegate instance].fadingMenuNavController showHideMenuView];
            }
            else {
                [self setSecondController:YES];
            }
            break;
        case 2:
            if ([Globals selectedMainControllerType] == MainControllerTypeThird) {
                [[AppDelegate instance].fadingMenuNavController showHideMenuView];
            }
            else {
                [self setThirdController:YES];
            }
            break;
        case 3:
            if ([Globals selectedMainControllerType] == MainControllerTypeFourth) {
                [[AppDelegate instance].fadingMenuNavController showHideMenuView];
            }
            else {
                [self setFourthController:YES];
            }
            break;
        case 4:
            if ([Globals selectedMainControllerType] == MainControllerTypeFifth) {
                [[AppDelegate instance].fadingMenuNavController showHideMenuView];
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
    if (!_firstVC) {
        _firstVC = [[FirstViewController alloc] init];
	}
    [Globals selectMainControllerType:MainControllerTypeFirst];
    [[AppDelegate instance].fadingMenuNavController setMainViewController:_firstVC animated:YES];
    
    [self removeSecondScreen];
    [self removeThirdScreen];
    [self removeFourthScreen];
    [self removeFifthScreen];
}

- (void)setSecondController:(BOOL)animated {
    if (!_secondVC) {
        _secondVC = [[SecondViewController alloc] init];
	}
    [Globals selectMainControllerType:MainControllerTypeSecond];
    [[AppDelegate instance].fadingMenuNavController setMainViewController:_secondVC animated:YES];
    
    [self removeFirstScreen];
    [self removeThirdScreen];
    [self removeFourthScreen];
    [self removeFifthScreen];
}

- (void)setThirdController:(BOOL)animated {
    if (!_thirdVC) {
        _thirdVC = [[ThirdViewController alloc] init];
	}
    [Globals selectMainControllerType:MainControllerTypeThird];
    [[AppDelegate instance].fadingMenuNavController setMainViewController:_thirdVC animated:YES];
    
    [self removeFirstScreen];
    [self removeSecondScreen];
    [self removeFourthScreen];
    [self removeFifthScreen];
}

- (void)setFourthController:(BOOL)animated {
    if (!_fourthVC) {
        _fourthVC = [[FourthViewController alloc] init];
	}
    [Globals selectMainControllerType:MainControllerTypeFourth];
    [[AppDelegate instance].fadingMenuNavController setMainViewController:_fourthVC animated:YES];
    
    [self removeFirstScreen];
    [self removeSecondScreen];
    [self removeThirdScreen];
    [self removeFifthScreen];
}

- (void)setFifthController:(BOOL)animated {
    if (!_fifthVC) {
        _fifthVC = [[FifthViewController alloc] init];
	}
    [Globals selectMainControllerType:MainControllerTypeFifth];
    [[AppDelegate instance].fadingMenuNavController setMainViewController:_fifthVC animated:YES];
    
    [self removeFirstScreen];
    [self removeSecondScreen];
    [self removeThirdScreen];
    [self removeFourthScreen];
}

#pragma mark - clear live screens
- (void)removeFirstScreen {
    if (_firstVC) {
        _firstVC = nil;
    }
}

- (void)removeSecondScreen {
    if (_secondVC) {
        _secondVC = nil;
    }
}

- (void)removeThirdScreen {
    if (_thirdVC) {
        _thirdVC = nil;
    }
}

- (void)removeFourthScreen {
    if (_fourthVC) {
        _fourthVC = nil;
    }
}

- (void)removeFifthScreen {
    if (_fifthVC) {
        _fifthVC = nil;
    }
}

@end
