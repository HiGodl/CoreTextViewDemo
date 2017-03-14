//
//  CoreTextData.h
//  VideoDemo
//
//  Created by jyLu on 2017/3/10.
//  Copyright © 2017年 jyLu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>
#import "CoreTextImageData.h"

@interface CoreTextData : NSObject

@property (nonatomic, assign) CTFrameRef ctFrame;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, strong) NSArray *imageArray;

@end
