//
//  AppDelegate.h
//  FadingViewDeck
//
//  Created by Kireto on 4/24/14.
//  Copyright (c) 2014 No Name. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FadingMenuViewController;
@class FadingViewDeckController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic,strong) UIWindow *window;
@property (nonatomic,strong) FadingViewDeckController *fadingViewDeckController;
@property (nonatomic,strong) FadingMenuViewController *menuViewController;

+ (AppDelegate*)instance;

@end
