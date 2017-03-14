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

@interface CTFrameParser : NSObject

+ (CoreTextData *)parseContent:(NSString *)content config:(CTFrameParserConfig *)config;


+(NSAttributedString *)loadTemplateFile:(NSString *)path config:(CTFrameParserConfig *)config;
+(CoreTextData *)parseTemplateFile:(NSString *)path config:(CTFrameParserConfig *) config;
+(CoreTextData *)parseAttributedStrContent:(NSAttributedString *)content config:(CTFrameParserConfig *)config;
@end
