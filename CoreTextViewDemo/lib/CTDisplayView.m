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
#import <SDWebImageDownloader.h>

//#import <UIImageView+WebCache.h>
//#import <SDWebImageDownloader.h>

@interface CTImageNeedToDraw : NSObject

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) CGRect position;
@property (nonatomic, assign) BOOL isDrawed;

@end

@implementation CTImageNeedToDraw

@end

@interface  CTDisplayView()

@property (nonatomic, strong) NSMutableArray *imageDictArr;

@end

@implementation CTDisplayView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    if (self.imageDictArr.count > 0) {
        for (NSInteger i = self.imageDictArr.count -1 ; i>=0; i--) {
            CTImageNeedToDraw *imageNeedToDraw = self.imageDictArr[i];
            CGContextDrawImage(context, imageNeedToDraw.position, imageNeedToDraw.image.CGImage);
            imageNeedToDraw.isDrawed = YES;
        }
    }
    
    if (self.data) {
        CTFrameDraw(self.data.ctFrame, context);
        if (self.imageDictArr.count > 0) {
            return;
        }
        if (self.data.imageArray && self.data.imageArray.count > 0) {
            for (CoreTextImageData *imageData in self.data.imageArray) {
                
                if ([imageData.name hasPrefix:@"http"]) {
                    NSURL *url = [NSURL URLWithString:imageData.name];
                    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:url options:SDWebImageDownloaderUseNSURLCache progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                    } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
                        CTImageNeedToDraw *imageNeedToDraw = [[CTImageNeedToDraw alloc] init];
                        imageNeedToDraw.image = image;
                        imageNeedToDraw.position = imageData.imagePosition;
                        imageNeedToDraw.isDrawed = NO;
                        [_imageDictArr addObject:imageNeedToDraw];
                        [self setNeedsDisplay];

                    }];
                }else{
                    CTImageNeedToDraw *imageNeedToDraw = [[CTImageNeedToDraw alloc] init];
                    UIImage *image = [UIImage imageNamed:imageData.name];
                    imageNeedToDraw.image = image;
                    imageNeedToDraw.position = imageData.imagePosition;
                    imageNeedToDraw.isDrawed = NO;
                    [_imageDictArr addObject:imageNeedToDraw];
                    [self setNeedsDisplay];
                }
            }
        }
    }
}

-(NSMutableArray *)imageDictArr{
    if (!_imageDictArr) {
        _imageDictArr = [NSMutableArray array];
    }
    return _imageDictArr;
}

@end
