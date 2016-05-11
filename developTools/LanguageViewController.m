//
//  LanguageViewController.m
//  developTools
//
//  Created by Kpeng on 15/10/20.
//  Copyright © 2015年 Kpeng. All rights reserved.
//

#import "LanguageViewController.h"
#import "LanguageDetailViewController.h"
@interface LanguageViewController  ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{

    NSArray *tabTitle;
    UITableView *dataTab;

}

@end

@implementation LanguageViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
//    self.navigationItem.title = @"语法";
    tabTitle =[NSArray arrayWithObjects:@"第一个程序helloWorld!",@"类的声明和定义",@"继承",@"class类型，选择器selecter",@"NSObject的奥秘",@"实例变量作用域修饰符",@"object_c中的set和get方法",@"内存管理",@"字符串，数组以及字典",@"属性",@"类目(Gategories)",@"协议(Protocols)",@"线程",@"文件系统",@"数据系列化及保存用户数据",@"网络编程",@"数据解析(Json)", nil];
    
    dataTab =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight-64)];
    dataTab.delegate = self;
    dataTab.dataSource =self;
    [self.view addSubview:dataTab];
    
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    
    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {


    return tabTitle.count;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 44.0;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellidentify =@"identify";
    
    UITableViewCell *cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentify];
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellidentify];
    }


    cell.textLabel.text = [tabTitle objectAtIndex:indexPath.row];
    if (indexPath.row == 4) {
        cell.textLabel.textColor = [UIColor redColor];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator ;
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {


    LanguageDetailViewController *detail =[[LanguageDetailViewController alloc]init];
    
    detail.topTitle = [tabTitle objectAtIndex:indexPath.row];
    detail.indexpath = indexPath.row;
    detail.totalpage = tabTitle.count;
    wpLog(@"点击了tableview");
    if (indexPath.row == 4) {
        
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"动手才能领略编程之美" message:@"你确定动手么？" delegate:self cancelButtonTitle:@"放弃" otherButtonTitles:@"动手+继续学习", nil];
        [alert show];
        
        
    } else {
    
    [self.navigationController pushViewController:detail animated:YES];

    }

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {

    if (buttonIndex == 1) {
         LanguageDetailViewController *detail =[[LanguageDetailViewController alloc]init];
         detail.indexpath = 5;
         detail.topTitle = @"实例变量作用域修饰符";
         [self.navigationController pushViewController:detail animated:YES];
 
    } else {
    
        LanguageDetailViewController *detail =[[LanguageDetailViewController alloc]init];
        detail.indexpath =100;
        detail.topTitle = @"放弃ios 说明";
        detail.upBtn.hidden = YES;
        detail.isGaveup = YES;
        [self.navigationController pushViewController:detail animated:YES];

    }
    
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
