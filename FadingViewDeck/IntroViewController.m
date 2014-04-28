//
//  IntroViewController.m
//  FadingViewDeck
//
//  Created by Kireto on 4/24/14.
//  Copyright (c) 2014 No Name. All rights reserved.
//

#import "IntroViewController.h"

#import "UINavigationController+CustomRotation.h"
#import "AppDelegate.h"
#import "Globals.h"

#import "FadingMenuViewController.h"
#import "FadingViewDeckController.h"
#import "FirstViewController.h"

@interface IntroViewController ()

@end

@implementation IntroViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithRed:246.0/255.0 green:246.0/255.0 blue:246.0/255.0 alpha:1.0];
    if ([Globals isOSVerionGreaterThanOrEqualTo:7.0]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self setupDeckController];
}

#pragma mark - setupDeckController
- (void)setupDeckController {
    
    [Globals selectMainControllerType:MainControllerTypeFirst];
    
    FadingMenuViewController* menuController = [[FadingMenuViewController alloc] init];
    UINavigationController *menuNavController = [[UINavigationController alloc] initWithRootViewController:menuController];
    [AppDelegate instance].menuViewController = menuController;
    
    FirstViewController *mainController = [[FirstViewController alloc] init];
    UINavigationController *mainNavController = [[UINavigationController alloc] initWithRootViewController:mainController];
    
    menuController.firstVC = mainController;
    menuController.firstNC = mainNavController;
    
    [AppDelegate instance].fadingViewDeckController = [[FadingViewDeckController alloc] initWithMainViewController:mainNavController
                                                                                                menuViewController:menuNavController];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:[AppDelegate instance].fadingViewDeckController];
    
    [self presentViewController:navController animated:NO completion:^{
        
    }];
}

@end
