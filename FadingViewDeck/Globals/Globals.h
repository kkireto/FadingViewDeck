//
//  Globals.h
//  
//
//  Created by Kireto on 12/14/12.
//  Copyright (c) 2012 No Name. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    MainControllerTypeFirst,
    MainControllerTypeSecond,
    MainControllerTypeThird,
    MainControllerTypeFourth,
    MainControllerTypeFifth,
    MainControllerTypeNone,
} MainControllerType;

@interface Globals : NSObject

+ (float)osVersion;
+ (BOOL)isOSVerionGreaterThanOrEqualTo:(float)compareValue;
+ (BOOL)validateEmail:(NSString *)candidate;

+ (void)saveUserDefaultsBoolValue:(BOOL)value forKey:(NSString*)key;
+ (void)saveUserDefaultsStringValue:(NSString*)value forKey:(NSString*)key;
+ (BOOL)loadUserDefaultsBoolValueForKey:(NSString*)key;
+ (NSString*)loadUserDefaultsStringValueForKey:(NSString*)key;
+ (void)loadUserDefaults;
+ (NSString*)encodeToPercentEscapeString:(NSString *)string;
+ (NSString*)decodeFromPercentEscapeString:(NSString *)string;

+ (MainControllerType)selectedMainControllerType;
+ (void)selectMainControllerType:(MainControllerType)mainControllerType;

+ (UIImage*)checkImage:(UIImage *)checkImage forRatio:(CGSize)ratioSize;
+ (UIImage*)checkImageRatio:(UIImage*)checkImage;

+ (UILabel*)labelWithFrame:(CGRect)labelFrame
                 labelFont:(UIFont*)labelFont
                labelColor:(UIColor*)labelColor
                 alignment:(NSTextAlignment)textAlignment
             andLabelTitle:(NSString*)labelTitle;

+ (UILabel*)labelWithFrame:(CGRect)labelFrame
             numberOfLines:(NSUInteger)numberOfLines
                 labelFont:(UIFont*)labelFont
                labelColor:(UIColor*)labelColor
                 alignment:(NSTextAlignment)textAlignment
             andLabelTitle:(NSString*)labelTitle;

+ (UILabel*)labelWithFrame:(CGRect)labelFrame
                 labelFont:(UIFont*)labelFont
                labelColor:(UIColor*)labelColor
                 alignment:(NSTextAlignment)textAlignment
                labelTitle:(NSString*)labelTitle
               shadowColor:(UIColor*)shadowColor
              shadowOffset:(CGSize)shadowOffset;

@end
