//
//  FadingViewDeckController.h
//  FadingViewDeck
//
//  Created by Kireto on 4/24/14.
//  Copyright (c) 2014 No Name. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    FadingViewDeckControllerPanLeft,
    FadingViewDeckControllerPanRight,
    FadingViewDeckControllerPanNone,
} FadingViewDeckControllerPanDirection;

@interface FadingViewDeckController : UIViewController

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
