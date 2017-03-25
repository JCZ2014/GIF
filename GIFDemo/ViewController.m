//
//  ViewController.m
//  GIFDemo
//
//  Created by YDD on 2017/3/14.
//  Copyright © 2017年 jcz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (NSArray *)animationImages {
    NSFileManager *fielM = [NSFileManager defaultManager];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Loading" ofType:@"bundle"];
    NSArray *arrays = [fielM contentsOfDirectoryAtPath:path error:nil];
    
    NSMutableArray *imagesArr = [NSMutableArray array];
    for (NSString *name in arrays) {
        UIImage *image = [UIImage imageNamed:[(@"Loading.bundle") stringByAppendingPathComponent:name]];
        if (image) {
            [imagesArr addObject:image];
        }
    }
    return imagesArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat height = [UIImage imageNamed:@"locationLoading0"].size.height;
    CGFloat width = [UIImage imageNamed:@"locationLoading0"].size.width;
    
    // 1、读取gif图片数据 注意:传入nil参数可能有警告,但是使用UIWebView的弊端在于，不能设置Gif动画的播放时间。
    /*
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"LODING" ofType:@"gif"]];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0,0,200,200)];
    [webView loadData:data MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:webView];
    */
    
    // 2、UIImageView
    UIImageView *gifImageView = [[UIImageView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - width) / 2, ([UIScreen mainScreen].bounds.size.height - height) / 2, width, height)];
    gifImageView.animationImages = [self animationImages]; //获取Gif图片列表
    gifImageView.contentMode = UIViewContentModeScaleAspectFit;
    gifImageView.animationDuration = 1.4;     //执行一次完整动画所需的时长
    gifImageView.animationRepeatCount = 0;  //动画重复次数
    [gifImageView startAnimating];
    [self.view addSubview:gifImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
