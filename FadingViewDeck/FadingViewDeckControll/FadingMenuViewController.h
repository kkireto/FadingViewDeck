//
//  FadingMenuViewController.h
//  FadingViewDeck
//
//  Created by Kireto on 4/24/14.
//  Copyright (c) 2014 No Name. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FirstViewController;
@class SecondViewController;
@class ThirdViewController;
@class FourthViewController;
@class FifthViewController;


@interface FadingMenuViewController : UIViewController

@property (nonatomic,strong) IBOutlet UITableView *tableView;
@property (nonatomic,strong) FirstViewController *firstVC;
@property (nonatomic,strong) SecondViewController *secondVC;
@property (nonatomic,strong) ThirdViewController *thirdVC;
@property (nonatomic,strong) FourthViewController *fourthVC;
@property (nonatomic,strong) FifthViewController *fifthVC;
@property (nonatomic,strong) UINavigationController *firstNC, *secondNC, *thirdNC, *fourthNC, *fifthNC;

@end
