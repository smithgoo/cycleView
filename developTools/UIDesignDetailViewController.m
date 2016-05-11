//
//  UIDesignDetailViewController.m
//  developTools
//
//  Created by Kpeng on 15/10/20.
//  Copyright © 2015年 Kpeng. All rights reserved.
//

#import "UIDesignDetailViewController.h"

@interface UIDesignDetailViewController ()<UIWebViewDelegate> {

    UIButton *upBtn;
    UIButton *downBtn;
    NSArray *tabTitle;
    UIWebView *webView ;

}

@end

@implementation UIDesignDetailViewController
@synthesize topTitle,indexpath;

- (void)viewWillAppear:(BOOL)animated {


    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
     tabTitle =[NSArray arrayWithObjects:@"Label",@"Button",@"View",@"Tableview",@"ScrollerView",@"Collectionview",@"键盘处理",@"通知",@"刷新控件",@"推送消息",@"公用类",@"等待指示器", @"第三方工具",nil];
    self.view.backgroundColor =[UIColor whiteColor];
    self.title = topTitle;
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD showWithStatus:@"正在加载..."];
    
    webView =[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    webView.delegate =self;
    [self.view addSubview:webView];
    
    
    NSString *path1= [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"2%d",indexpath] ofType:@"html"];
    NSLog(@"path1%@",path1);
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path1]]];
    
    
    
    upBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    upBtn.frame =CGRectMake(screenWidth-40, 40+30, 30, 30);
    upBtn.tag = 100;
    [upBtn setTitleColor:@"up" forState:UIControlStateNormal];
    [upBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [upBtn setBackgroundImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
    [upBtn addTarget:self action:@selector(fanye:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:upBtn];
    
    
    downBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    downBtn.tag =101;
    downBtn.frame =CGRectMake(screenWidth-40, screenHeight-40, 30, 30);
    [downBtn setBackgroundImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
    
    [downBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [downBtn addTarget:self action:@selector(fanye:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:downBtn];

    
}

- (void)fanye:(UIButton *)sender {
    
    if (sender.tag == 100) {
        if (indexpath  == 0) {
            
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:nil message:@"已经是第一页了" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            
            return;
            
        }
        
        
            indexpath --;
            [UIView animateWithDuration:1 animations:^{
                [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:webView cache:YES];
            }];
        
        NSURL *fileURL = [[NSBundle mainBundle] URLForResource:[NSString stringWithFormat:@"2%d.html",indexpath] withExtension:nil];
        self.navigationItem.title = [tabTitle objectAtIndex:indexpath];
        NSURLRequest *request = [NSURLRequest requestWithURL:fileURL];
        
        [webView loadRequest:request];
        
        
        
    }
    if (sender.tag == 101) {
        if (indexpath == tabTitle.count - 1) {
            
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:nil message:@"已经是最后一页了" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            return;
            
        }
     
            
            indexpath ++;
            [UIView animateWithDuration:1 animations:^{
                [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:webView cache:YES];
            }];
        NSURL *fileURL = [[NSBundle mainBundle] URLForResource:[NSString stringWithFormat:@"2%d.html",indexpath] withExtension:nil];
        self.navigationItem.title = [tabTitle objectAtIndex:indexpath ];
        NSURLRequest *request = [NSURLRequest requestWithURL:fileURL];
        
        [webView loadRequest:request];
        
        
        
    }
    
    
}



- (void)webViewDidFinishLoad:(UIWebView *)webView {


    [SVProgressHUD dismissWithDelay:0.7];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
