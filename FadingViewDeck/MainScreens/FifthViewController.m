//
//  FifthViewController.m
//  FadingViewDeck
//
//  Created by Kireto on 4/28/14.
//  Copyright (c) 2014 No Name. All rights reserved.
//

#import "FifthViewController.h"

#import "AppDelegate.h"
#import "FadingViewDeckController.h"

@interface FifthViewController ()

@end

@implementation FifthViewController

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
    self.view.backgroundColor = [UIColor colorWithRed:246.0/255.0 green:246.0/255.0 blue:246.0/255.0 alpha:1.0];
    self.title = NSLocalizedString(@"Fifth", @"Fifth");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[AppDelegate instance].fadingViewDeckController addPanGessture];
    [[AppDelegate instance].fadingViewDeckController setupMenuButtonForController:self];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[AppDelegate instance].fadingViewDeckController removePanGessture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
