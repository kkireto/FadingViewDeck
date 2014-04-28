//
//  UINavigationController+CustomRotation.m
//  
//
//  Created by Kireto on 11/19/13.
//  Copyright (c) 2013 No Name. All rights reserved.
//

#import "UINavigationController+CustomRotation.h"

@implementation UINavigationController (LockRotation)

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (BOOL)disablesAutomaticKeyboardDismissal {
    return NO;
}

@end
