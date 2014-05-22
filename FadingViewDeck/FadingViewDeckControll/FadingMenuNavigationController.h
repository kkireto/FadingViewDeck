//
//  FadingMenuNavigationController.h
//  FadingViewDeck
//
//  Created by Kireto on 5/19/14.
//  Copyright (c) 2014 No Name. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    FadingMenuPanLeft,
    FadingMenuPanRight,
    FadingMenuPanNone,
} FadingMenuPanDirection;

@interface FadingMenuNavigationController : UINavigationController

@property (nonatomic,strong) UIViewController* mainController;
@property (nonatomic,strong) UIViewController* menuController;

- (id)initWithMainViewController:(UIViewController*)mainController
              menuViewController:(UIViewController*)menuController;

- (void)setMainViewController:(UIViewController*)mainController animated:(BOOL)animated;
- (void)setupMenuButtonForController:(UIViewController*)controller;
- (void)setupCloseButtonForController:(UIViewController*)controller;

- (void)showHideMenuView;
- (void)removePanGessture;
- (void)addPanGessture;

@end
