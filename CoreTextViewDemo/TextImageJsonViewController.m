//
//  TextImageJsonViewController.m
//  CoreTextViewDemo
//
//  Created by jyLu on 2017/3/27.
//  Copyright © 2017年 jyLu. All rights reserved.
//

#import "TextImageJsonViewController.h"

#import "CTDisplayView.h"
#import "CTFrameParserConfig.h"
#import "CTFrameParser.h"
#import "CoreTextData.h"

@interface TextImageJsonViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) CTDisplayView *displayView;

@end

@implementation TextImageJsonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self initData];
}

-(void)initUI{
    CTDisplayView *displayView = [[CTDisplayView alloc] init];
    [self.scrollView addSubview:displayView];
    self.displayView = displayView;
}

-(void)initData{
    CTFrameParserConfig *config = [[CTFrameParserConfig alloc] init];
    //config.textColor = [UIColor redColor];
    config.width = [UIScreen mainScreen].bounds.size.width;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"textAndImage" ofType:@"json"];
    
    CoreTextData *data = [CTFrameParser parseTemplateFile:path config:config];
    self.displayView.data = data;
    self.displayView.backgroundColor = [UIColor whiteColor];
    self.displayView.frame = CGRectMake(0, -64, [UIScreen mainScreen].bounds.size.width, data.height);
    self.scrollView.contentSize = self.displayView.frame.size;
    //self.displayView.backgroundColor = [UIColor yellowColor];
}

@end
