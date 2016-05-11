//
//  LanguageDetailViewController.h
//  developTools
//
//  Created by Kpeng on 15/10/20.
//  Copyright © 2015年 Kpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LanguageDetailViewController : UIViewController
@property(nonatomic,strong) NSString *topTitle;
@property(nonatomic,assign) NSInteger indexpath;
@property(nonatomic,assign) NSInteger totalpage;
@property(nonatomic,strong) UIButton *upBtn;
@property(nonatomic,strong) UIButton *downBtn;
@property(nonatomic,assign)  bool  isGaveup;//用 bool表示yes  BOOL 少用
@end
