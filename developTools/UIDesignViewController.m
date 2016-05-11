//
//  UIDesignViewController.m
//  developTools
//
//  Created by Kpeng on 15/10/20.
//  Copyright © 2015年 Kpeng. All rights reserved.
//

#import "UIDesignViewController.h"
#import "UIDesignDetailViewController.h"

@interface UIDesignViewController ()<UITableViewDataSource,UITableViewDelegate> {


    
        
        NSArray *tabTitle;
        
    
}

@end

@implementation UIDesignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor =[UIColor whiteColor];
    self.title = @"UI设计";
    // Do any additional setup after loading the view.
    tabTitle =[NSArray arrayWithObjects:@"Label",@"Button",@"View",@"Tableview",@"ScrollerView",@"Collectionview",@"键盘处理",@"通知",@"刷新控件",@"推送消息",@"公用类",@"等待指示器", @"第三方工具",nil];
//    
    UITableView *dataTab =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight-44)];
    dataTab.delegate = self;
    dataTab.dataSource =self;
    [self.view addSubview:dataTab];
//
//    UILabel *label =[setUI creteLabelWithFrame:CGRectMake(0, 20, screenWidth, 40) lebelText:@"123" labelFont:[UIFont systemFontOfSize:18] labelTextAlignment:NSTextAlignmentCenter labelTextColor:[UIColor redColor] labelBackGroundColor:[UIColor greenColor]];
//    
//    [dataTab addSubview:label];
    
   
    
    
    
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return tabTitle.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellidentify =@"identify";
    
    UITableViewCell *cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentify];
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellidentify];
    }
    
    
    cell.textLabel.text = [tabTitle objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator ;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
    UIDesignDetailViewController *detail =[[UIDesignDetailViewController alloc]init];
    detail.topTitle =[tabTitle objectAtIndex:indexPath.row];
    detail.indexpath = indexPath.row;
    [self.navigationController pushViewController:detail animated:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
