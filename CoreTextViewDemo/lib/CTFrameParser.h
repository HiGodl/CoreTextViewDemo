//
//  CTFrameParser.h
//  VideoDemo
//
//  Created by jyLu on 2017/3/10.
//  Copyright © 2017年 jyLu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CoreTextData;
@class CTFrameParserConfig;

//RGBColor
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//RGB color macro with alpha
#define UIColorFromRGBWithAlpha(rgbValue,a) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

@interface CTFrameParser : NSObject

+ (CoreTextData *)parseContent:(NSString *)content config:(CTFrameParserConfig *)config;


+(NSAttributedString *)loadTemplateFile:(NSString *)path config:(CTFrameParserConfig *)config;
+(CoreTextData *)parseTemplateFile:(NSString *)path config:(CTFrameParserConfig *) config;
+(CoreTextData *)parseAttributedStrContent:(NSAttributedString *)content config:(CTFrameParserConfig *)config;
@end
