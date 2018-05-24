//
//  ViewController.m
//  PhotoBrowser
//
//  Created by paperclouds on 2018/5/24.
//  Copyright © 2018年 hechang. All rights reserved.
//

#import "ViewController.h"
#import <YBImageBrowser.h>
#import <SDCycleScrollView.h>

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *originalImageUrls; //原图数组

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initData];
    [self createUI];
}

- (void)initData{
    
    // 1.2 创建原图图片链接数组
    self.originalImageUrls = [NSMutableArray array];
    // 添加图片(原图)链接
    [self.originalImageUrls addObject:@"http://ww3.sinaimg.cn/large/006ka0Iygw1f6bqm7zukpj30g60kzdi2.jpg"];
    [self.originalImageUrls addObject:@"http://ww1.sinaimg.cn/large/61b69811gw1f6bqb1bfd2j20b4095dfy.jpg"];
    [self.originalImageUrls addObject:@"http://ww1.sinaimg.cn/large/54477ddfgw1f6bqkbanqoj20ku0rsn4d.jpg"];
    [self.originalImageUrls addObject:@"http://ww4.sinaimg.cn/large/006ka0Iygw1f6b8gpwr2tj30bc0bqmyz.jpg"];
    [self.originalImageUrls addObject:@"http://ww2.sinaimg.cn/large/9c2b5f31jw1f6bqtinmpyj20dw0ae76e.jpg"];
    [self.originalImageUrls addObject:@"http://ww1.sinaimg.cn/large/536e7093jw1f6bqdj3lpjj20va134ana.jpg"];
    [self.originalImageUrls addObject:@"http://ww1.sinaimg.cn/large/75b1a75fjw1f6bqn35ij6j20ck0g8jtf.jpg"];
    [self.originalImageUrls addObject:@"http://ww2.sinaimg.cn/large/005NFHyQgw1f6bn8bha0eg308w0gib2d.gif"];
    [self.originalImageUrls addObject:@"http://ww1.sinaimg.cn/large/86afb21egw1f6bq3lq0itj20gg0c2myt.jpg"];
}

- (void)createUI{
    SDCycleScrollView *scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 100, kScreenWidth, 200) delegate:self placeholderImage:nil];
    [self.view addSubview:scrollView];
    
    scrollView.imageURLStringsGroup = self.originalImageUrls;
    scrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    scrollView.autoScroll = NO;
}

#pragma mark - SDCycleScrollViewDelegate

-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSMutableArray *dataArray = [NSMutableArray array];
    for (int i = 0; i < self.originalImageUrls.count; i++) {
        YBImageBrowserModel *model = [YBImageBrowserModel new];
        model.url = [NSURL URLWithString:self.originalImageUrls[i]];
        [dataArray addObject:model];
    }
    
    YBImageBrowser *browser = [YBImageBrowser new];
    browser.dataArray = dataArray;
    browser.currentIndex = index;
    [browser show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
