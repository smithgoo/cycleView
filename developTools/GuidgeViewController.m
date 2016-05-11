//
//  GuidgeViewController.m
//  developTools
//
//  Created by Kpeng on 15/10/22.
//  Copyright © 2015年 Kpeng. All rights reserved.
//

#import "GuidgeViewController.h"
#import "MainTabBarViewController.h"
@interface GuidgeViewController () <UIScrollViewDelegate>{


    UIPageControl * _pageControl;

}

@end

@implementation GuidgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    UIScrollView *mainscroller =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    mainscroller.contentSize = CGSizeMake(screenWidth *4, screenHeight);
    mainscroller.pagingEnabled = YES;
    mainscroller.scrollEnabled = YES;
//    mainscroller.bounces =NO;
    mainscroller.delegate =self;
    [self.view addSubview:mainscroller];
    
    for (int index =0; index <4; index++) {
        
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(screenWidth*index, 0, screenWidth, screenHeight)];
        imageview.image =[UIImage imageNamed:[NSString stringWithFormat:@"log%d.gif",index+1]];
        imageview.tag = 10000+index;
        [mainscroller addSubview:imageview];
        
    }
    
    
    
    
   
    
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(120, screenHeight - 70, screenWidth-240, 40)];
    _pageControl.backgroundColor = [UIColor clearColor];
    _pageControl.numberOfPages = 4;
    _pageControl.currentPage = 0;
    _pageControl.userInteractionEnabled = NO;
    _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    [self.view addSubview:_pageControl];
    
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame =CGRectMake((screenWidth - 60)/2 + screenWidth *3, screenHeight -60, 60, 40);
//    btn.backgroundColor =[UIColor blackColor];
    [btn setBackgroundImage:[UIImage imageNamed:@"xuanzhong"] forState:UIControlStateNormal];
//    [btn setTitle:@"点击进入" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(goto) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    
}

- (void)goto {

    MainTabBarViewController *tab =[[MainTabBarViewController alloc]init];
    [self.navigationController pushViewController:tab animated:YES];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    _pageControl.currentPage = scrollView.contentOffset.x/screenWidth;

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
