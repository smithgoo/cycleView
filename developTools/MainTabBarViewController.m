//
//  MainTabBarViewController.m
//  developTools
//
//  Created by Kpeng on 15/10/20.
//  Copyright © 2015年 Kpeng. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "LanguageViewController.h"
#import "UIDesignViewController.h"
#import "Knowledge_of_difficultiesViewController.h"
#import "Interview_questionsViewController.h"
#import "Support_UsViewController.h"
@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

-(void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:YES];
    //隐藏导航栏
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.navigationItem setHidesBackButton:YES];//隐藏左按钮


}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
   
    
    
    LanguageViewController *c1=[[LanguageViewController alloc]init];
    c1.view.backgroundColor=[UIColor whiteColor];
    c1.tabBarItem.title=@"语法知识";
    c1.tabBarItem.image=[UIImage imageNamed:@"yufa"];
//    c1.tabBarItem.badgeValue=@"123";
    
    UIDesignViewController *c2=[[UIDesignViewController alloc]init];
    c2.view.backgroundColor=[UIColor whiteColor];
    c2.tabBarItem.title=@"UI设计";
    c2.tabBarItem.image=[UIImage imageNamed:@"ui"];
//    c2.tabBarItem.badgeValue=@"123";
    
//    Knowledge_of_difficultiesViewController *c3=[[Knowledge_of_difficultiesViewController alloc]init];
//    c3.view.backgroundColor=[UIColor whiteColor];
//    c3.tabBarItem.title=@"知识难点";
//    c3.tabBarItem.image=[UIImage imageNamed:@"tab_recent_nor"];
//    c3.tabBarItem.badgeValue=@"123";
    
    Interview_questionsViewController *c4=[[Interview_questionsViewController alloc]init];
    c4.view.backgroundColor=[UIColor whiteColor];
    c4.tabBarItem.title=@"面试技巧";
    c4.tabBarItem.image=[UIImage imageNamed:@"jianli"];
//    c4.tabBarItem.badgeValue=@"123";
    
    Support_UsViewController *c5=[[Support_UsViewController alloc]init];
    c5.view.backgroundColor=[UIColor whiteColor];
    c5.tabBarItem.title=@"支持我们";
    c5.tabBarItem.image=[UIImage imageNamed:@"women"];
//    c5.tabBarItem.badgeValue=@"123";
    
    
    self.viewControllers =@[c1,c2,c4,c5 ];

   
    // Do any additional setup after loading the view.
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
