//
//  WebViewController.m
//  developTools
//
//  Created by Kpeng on 15/10/31.
//  Copyright © 2015年 Kpeng. All rights reserved.
//

#import "WebViewController.h"
#import <UIKit/UIKit.h>
@interface WebViewController ()<UIWebViewDelegate> {

    UIWebView *webView;

}

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 60, 30);
    [button setTitle:@"打印" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(saveTheFile:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = item;
    
   
    self.view.backgroundColor = [UIColor whiteColor];
    webView =[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    webView.delegate =self;
    webView.scalesPageToFit = YES;
    [self.view addSubview:webView];
    
    if (self.indexpath ==1) {
        
//        UIPrintInteractionController *pc = [[UIPrintInteractionController alloc]init];

        NSString *path1= [[NSBundle mainBundle] pathForResource:@"面试礼仪" ofType:@"docx"];
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path1]]];
        self.navigationItem.title =@"面试礼仪";

        
        
    }
    if (self.indexpath == 2) {
        NSString *path1= [[NSBundle mainBundle] pathForResource:@"iOS面试题" ofType:@"pdf"];
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path1]]];
        self.navigationItem.title =@"iOS面试题";
    }
    if (self.indexpath ==0) {
        NSString *path1= [[NSBundle mainBundle] pathForResource:@"ios开发工程师简历模板" ofType:@"pdf"];
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path1]]];
        self.navigationItem.title =@"简历模板";
    }
    if (self.indexpath == 3) {
        NSString *path1= [[NSBundle mainBundle] pathForResource:@"iOS开发中修改bug" ofType:@"pdf"];
        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path1]]];
        self.navigationItem.title =@"如何修改bug";
    }

   
}

-(void)saveTheFile:(NSInteger)sender{


    if (self.indexpath ==0) {
        
        NSLog(@"如何写简历");
        NSString *message=@"打印文档";
        UIImage *image=[UIImage imageNamed:@"简历模板.jpg"];
         UIImage *image1=[UIImage imageNamed:@"简历模板1.jpg"];
        

        
        UIActivityViewController *activty=[[UIActivityViewController alloc]initWithActivityItems:@[message,image,image1] applicationActivities:nil];
        [self presentViewController:activty animated:YES completion:nil];
        
        

    }
    if (self.indexpath ==1) {
   
        NSLog(@"面试礼仪");
        
        NSString *message=@"打印文档";
        UIImage *image=[UIImage imageNamed:@"面试礼仪1.jpg"];
        UIImage *image1=[UIImage imageNamed:@"面试礼仪2.jpg"];
        
        
        
        UIActivityViewController *activty=[[UIActivityViewController alloc]initWithActivityItems:@[message,image,image1] applicationActivities:nil];
        [self presentViewController:activty animated:YES completion:nil];
    }
    if (self.indexpath ==2) {
        
       NSLog(@"ios面试题");
        
        NSString *message=@"打印文档";
         UIImage *image1=[UIImage imageNamed:@"0001.jpg"];
         UIImage *image2=[UIImage imageNamed:@"0002.jpg"];
         UIImage *image3=[UIImage imageNamed:@"0003.jpg"];
         UIImage *image4=[UIImage imageNamed:@"0004.jpg"];
         UIImage *image5=[UIImage imageNamed:@"0005.jpg"];
         UIImage *image6=[UIImage imageNamed:@"0006.jpg"];
         UIImage *image7=[UIImage imageNamed:@"0007.jpg"];
         UIImage *image8=[UIImage imageNamed:@"0008.jpg"];
         UIImage *image9=[UIImage imageNamed:@"0009.jpg"];
         UIImage *image10=[UIImage imageNamed:@"0010.jpg"];
         UIImage *image11=[UIImage imageNamed:@"0011.jpg"];
         UIImage *image12=[UIImage imageNamed:@"0012.jpg"];
         UIImage *image13=[UIImage imageNamed:@"0013.jpg"];
         UIImage *image14=[UIImage imageNamed:@"0014.jpg"];
         UIImage *image15=[UIImage imageNamed:@"0015.jpg"];
         UIImage *image16=[UIImage imageNamed:@"0016.jpg"];
         UIImage *image17=[UIImage imageNamed:@"0017.jpg"];
         UIImage *image18=[UIImage imageNamed:@"0018.jpg"];
         UIImage *image19=[UIImage imageNamed:@"0019.jpg"];
         UIImage *image20=[UIImage imageNamed:@"0020.jpg"];
         UIImage *image21=[UIImage imageNamed:@"0021.jpg"];
         UIImage *image22=[UIImage imageNamed:@"0022.jpg"];
         UIImage *image23=[UIImage imageNamed:@"0023.jpg"];
         UIImage *image24=[UIImage imageNamed:@"0024.jpg"];
         UIImage *image25=[UIImage imageNamed:@"0025.jpg"];
         UIImage *image26=[UIImage imageNamed:@"0026.jpg"];
         UIImage *image27=[UIImage imageNamed:@"0027.jpg"];
         UIImage *image28=[UIImage imageNamed:@"0028.jpg"];
         UIImage *image29=[UIImage imageNamed:@"0029.jpg"];
         UIImage *image30=[UIImage imageNamed:@"0030.jpg"];
        UIImage *image31=[UIImage imageNamed:@"0031.jpg"];
        UIImage *image32=[UIImage imageNamed:@"0032.jpg"];
        UIImage *image33=[UIImage imageNamed:@"0033.jpg"];
        UIImage *image34=[UIImage imageNamed:@"0034.jpg"];
        UIImage *image35=[UIImage imageNamed:@"0035.jpg"];
        UIImage *image36=[UIImage imageNamed:@"0036.jpg"];
        UIImage *image37=[UIImage imageNamed:@"0037.jpg"];
        UIImage *image38=[UIImage imageNamed:@"0038.jpg"];
        UIImage *image39=[UIImage imageNamed:@"0039.jpg"];
        UIImage *image40=[UIImage imageNamed:@"0040.jpg"];
        UIImage *image41=[UIImage imageNamed:@"0041.jpg"];
        UIImage *image42=[UIImage imageNamed:@"0042.jpg"];
        UIImage *image43=[UIImage imageNamed:@"0043.jpg"];
        UIImage *image44=[UIImage imageNamed:@"0044.jpg"];
        UIImage *image45=[UIImage imageNamed:@"0045.jpg"];
        UIImage *image46=[UIImage imageNamed:@"0046.jpg"];
        
        UIActivityViewController *activty=[[UIActivityViewController alloc]initWithActivityItems:@[message,image1,image2,image3,image4,image5,image6,image7,image8,image9,image10,image11,image12,image13,image14,image15,image16,image17,image18,image19,image20,image21,image22,image23,image24,image25,image26,image27,image28,image29,image30,image31,image32,image33,image34,image35,image36,image37,image38,image39,image40,image41,image42,image43,image44,image45,image46] applicationActivities:nil];
        [self presentViewController:activty animated:YES completion:nil];
        

       
    }
    if (self.indexpath ==3) {
        
         NSLog(@"bug解决方法");
        
        NSString *message=@"打印文档";
        UIImage *image=[UIImage imageNamed:@"修改bug1.jpg"];
         UIImage *image1=[UIImage imageNamed:@"修改bug2.jpg"];
         UIImage *image2=[UIImage imageNamed:@"修改bug3.jpg"];
         UIImage *image3=[UIImage imageNamed:@"修改bug4.jpg"];
         UIImage *image4=[UIImage imageNamed:@"修改bug5.jpg"];
         UIImage *image5=[UIImage imageNamed:@"修改bug6.jpg"];
         UIImage *image6=[UIImage imageNamed:@"修改bug7.jpg"];
        
        
        UIActivityViewController *activty=[[UIActivityViewController alloc]initWithActivityItems:@[message,image,image1,image2,image3,image4,image5,image6] applicationActivities:nil];
        [self presentViewController:activty animated:YES completion:nil];
  
    }

    
    
    
}






@end
