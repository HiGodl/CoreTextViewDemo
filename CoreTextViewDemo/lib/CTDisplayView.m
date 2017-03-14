//
//  CTDisplayView.m
//  VideoDemo
//
//  Created by jyLu on 2017/3/10.
//  Copyright © 2017年 jyLu. All rights reserved.
//

#import "CTDisplayView.h"
#import <CoreText/CoreText.h>
#import "CoreTextData.h"
//#import <UIImageView+WebCache.h>
//#import <SDWebImageDownloader.h>

@implementation CTDisplayView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    if (self.data) {
        CTFrameDraw(self.data.ctFrame, context);
//        if (self.data.imageArray && self.data.imageArray.count > 0) {
//            for (CoreTextImageData *imageData in self.data.imageArray) {
//                
//            
//                NSURL *url = [NSURL URLWithString:imageData.name];
////                [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:url options:SDWebImageDownloaderUseNSURLCache progress:^(NSInteger receivedSize, NSInteger expectedSize) {
////                    
////                } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
////                    dispatch_async(dispatch_get_main_queue(), ^{
//////                        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//////                        imageView.frame = imageData.imagePosition;
//////                        [self addSubview:imageView];
////                        CGContextDrawImage(context, imageData.imagePosition, image.CGImage);
////                    });
////                    
////                    
////                }];
//            }
//        }
    }
}

@end
