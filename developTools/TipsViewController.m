//
//  TipsViewController.m
//  developTools
//
//  Created by Kpeng on 15/10/28.
//  Copyright © 2015年 Kpeng. All rights reserved.
//

#import "TipsViewController.h"
#import "MainTabBarViewController.h"
#import "ZYAnimationLayer.h"
@interface TipsViewController ()

@end

@implementation TipsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
//    self.title = @"tips";

    
    YLImageView *imageview =[[YLImageView alloc]initWithFrame:CGRectMake(10, 74, SCREEN_WIDTH-20, (SCREEN_WIDTH-20)*90/280)];
    imageview.image = [YLGIFImage imageNamed:@"012.gif"];
    [self.view addSubview:imageview];
    
    UILabel *title =[[UILabel alloc]initWithFrame:CGRectMake(10, (screenHeight -100)/2-40, screenWidth -20, 30)];
    title.text =@"格言";
    title.textAlignment =NSTextAlignmentCenter ;
    [self.view addSubview:title];

    UILabel *tipsLab = [[UILabel alloc]initWithFrame:CGRectMake(10, (screenHeight -100)/2, screenWidth -20, 100)];
    tipsLab.textColor =[UIColor redColor];
    tipsLab.font =[UIFont systemFontOfSize:18];
//    tipsLab.text =@"这是一个小贴士小贴士小贴士";
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Quotes" ofType:@"plist"];
    NSMutableDictionary *dic =[[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
    NSLog(@"--%@",[dic objectForKey:@"Quotes"]);
    NSArray *titleArr =[dic objectForKey:@"Quotes"];
    int x = arc4random() % titleArr.count;
    
   tipsLab.text =[titleArr objectAtIndex:x];
    tipsLab.textAlignment = NSTextAlignmentCenter;
    tipsLab.numberOfLines = 0;
    [self.view addSubview:tipsLab];
    
    YLImageView *imageview1 =[[YLImageView alloc]initWithFrame:CGRectMake(10, tipsLab.bottom+10, SCREEN_WIDTH-20, (SCREEN_WIDTH-20)*90/700)];
    imageview1.image = [YLGIFImage imageNamed:@"456.jpg"];
    [self.view addSubview:imageview1];
    
    
    
    [ZYAnimationLayer createAnimationLayerWithString:@"人生苦短，即时行乐" andRect: CGRectMake(20.0f, 200.0f,
                                                                                       CGRectGetWidth(self.view.layer.bounds) - 40.0f,
                                                                                       CGRectGetHeight(self.view.layer.bounds) - 84.0f) andView:self.view andFont:CTFontCreateWithName(CFSTR("Helvetica-Bold"),40.0f, NULL) andStrokeColor:[UIColor colorWithRed:0.3 green:0.2 blue:0.5 alpha:1]];
    
   
    
    
    NSTimer *timer =[NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(goAfordView) userInfo:nil repeats:NO];
}

-(void) goAfordView {

    MainTabBarViewController *main =[[MainTabBarViewController alloc]init];
    
//    [self presentModalViewController:main animated:YES];
    [self.navigationController pushViewController:main animated:YES];

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
