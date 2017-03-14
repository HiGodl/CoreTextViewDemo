//
//  CTFrameOarserConfig.h
//  VideoDemo
//
//  Created by jyLu on 2017/3/10.
//  Copyright © 2017年 jyLu. All rights reserved.
//

#import <UIKit/UIKit.h>

///colors
//RGBColor
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface CTFrameParserConfig : NSObject

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat fontSize;
@property (nonatomic, assign) CGFloat lineSpace;
@property (nonatomic, strong) UIColor *textColor;

@end
