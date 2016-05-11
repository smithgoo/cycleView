//
//  LanguageDetailViewController.m
//  developTools
//
//  Created by Kpeng on 15/10/20.
//  Copyright © 2015年 Kpeng. All rights reserved.
//

#import "LanguageDetailViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

typedef enum : NSUInteger {
        Fade = 1,                   //淡入淡出
        Push,                       //推挤
        Reveal,                     //揭开
         MoveIn,                     //覆盖
       Cube,                       //立方体
        SuckEffect,                 //吮吸
         OglFlip,                    //翻转
        RippleEffect,               //波纹
         PageCurl,                   //翻页
         PageUnCurl,                 //反翻页
        CameraIrisHollowOpen,       //开镜头
         CameraIrisHollowClose,      //关镜头
        CurlDown,                   //下翻页
        CurlUp,                     //上翻页
       FlipFromLeft,               //左翻转
        FlipFromRight,              //右翻转
    
     } AnimationType;
@interface LanguageDetailViewController () <UIWebViewDelegate>{

    UIWebView *webView;
    NSArray *tabTitle;
    NSString *basePath;
    
}

@end

@implementation LanguageDetailViewController
@synthesize topTitle,indexpath,totalpage,upBtn,downBtn,isGaveup;

-(void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:YES];
 [self.navigationController setNavigationBarHidden:NO animated:YES];
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = topTitle;
    self.view.backgroundColor =[UIColor whiteColor];
    
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
     [SVProgressHUD showWithStatus:@"正在加载..."];
    // Do any additional setup after loading the view.

     tabTitle =[NSArray arrayWithObjects:@"第一个程序helloWorld!",@"类的声明和定义",@"继承",@"class类型，选择器selecter",@"NSObject的奥秘",@"实例变量作用域修饰符",@"object_c中的set和get方法",@"内存管理",@"字符串，数组以及字典",@"属性",@"类目(Gategories)",@"协议(Protocols)",@"线程",@"文件系统",@"数据系列化及保存用户数据",@"网络编程",@"数据解析(Json)", nil];
    
    webView =[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    webView.delegate =self;
    [self.view addSubview:webView];
    

    
    NSString *path1= [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d",indexpath] ofType:@"html"];
    NSLog(@"path1%@",path1);
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path1]]];
    
    basePath = [[NSBundle mainBundle] resourcePath];
    NSLog(@"basePath%@",basePath);
    
    


        
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
    
    if (isGaveup == YES) {
        downBtn.hidden = YES;
        upBtn.hidden = YES;
    } else {
    
        downBtn.hidden = NO;
        upBtn.hidden = NO;
    
    
    }

}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {


    upBtn.hidden = YES;
    downBtn.hidden = YES;


}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    upBtn.hidden = NO;
    downBtn.hidden = NO;
    

}


- (void)fanye:(UIButton *)sender {

    if (sender.tag == 100) {
        if (indexpath  == 0) {
          
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:nil message:@"已经是第一页了" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            
            return;
            
        }
        
        if (indexpath == 5) {
            [UIView animateWithDuration:1 animations:^{
                        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:webView cache:YES];
                   }];
            indexpath = indexpath -2;
        } else {
        indexpath --;
            [UIView animateWithDuration:1 animations:^{
                [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:webView cache:YES];
            }];
        }
        NSURL *fileURL = [[NSBundle mainBundle] URLForResource:[NSString stringWithFormat:@"%d.html",indexpath] withExtension:nil];
        self.navigationItem.title = [tabTitle objectAtIndex:indexpath];
        NSURLRequest *request = [NSURLRequest requestWithURL:fileURL];
        
        [webView loadRequest:request];
      
       
        
    }
    if (sender.tag == 101) {
        if (indexpath == totalpage - 1) {
            
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:nil message:@"已经是最后一页了" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            return;
            
        }
        if (indexpath ==3) {
            [UIView animateWithDuration:1 animations:^{
                [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:webView cache:YES];
            }];
            indexpath = indexpath +2;
           
            
        } else {
        
        indexpath ++;
            [UIView animateWithDuration:1 animations:^{
                [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:webView cache:YES];
            }];
        }
        NSURL *fileURL = [[NSBundle mainBundle] URLForResource:[NSString stringWithFormat:@"%d.html",indexpath] withExtension:nil];
        self.navigationItem.title = [tabTitle objectAtIndex:indexpath ];
        NSURLRequest *request = [NSURLRequest requestWithURL:fileURL];
        
        [webView loadRequest:request];
    
      
        
    }


}


-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSString *path = request.URL.relativePath;
    //当不是本地的网页时不需要加上basePath
    NSLog(@"跳转路径为%@",path);
    if([path hasPrefix:[basePath stringByAppendingPathComponent:@"methodTools"]]){
        //取到协议里定义的方法名和参数值
        NSString *functionName = [[[path lastPathComponent] componentsSeparatedByString:@":"] firstObject];
        NSString *functionValue = [[[path lastPathComponent] componentsSeparatedByString:@":"] lastObject];
        //如果有传参数值
        if([[path lastPathComponent] componentsSeparatedByString:@":"].count > 1){
            if([self respondsToSelector:NSSelectorFromString([functionName stringByAppendingString:@":"])]){
                [self performSelector:NSSelectorFromString([functionName stringByAppendingString:@":"]) withObject:functionValue];
            }
        }else{
            if([self respondsToSelector:NSSelectorFromString(functionName)]){
                [self performSelector:NSSelectorFromString(functionName) withObject:nil];
            }
        }
        
        return NO;
    }
    
    return YES;

}

//- (void)webViewDidStartLoad:(UIWebView *)webView {
//
//   
//
////    [MBProgressHUD waitShow:@"正在加载..." view:self.view];
//   
//
//
//}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [SVProgressHUD dismissWithDelay:0.7];
//    [MBProgressHUD hideHUD];
    
    //字体颜色
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.webkitTextFillColor= 'white'"];
    //页面背景色
    
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.background='#2E2E2E'"];


}
- (void)backtoview:(NSString *)value{

    [self.navigationController popViewControllerAnimated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
