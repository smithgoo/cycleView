//
//  Support_UsViewController.m
//  developTools
//
//  Created by Kpeng on 15/10/22.
//  Copyright © 2015年 Kpeng. All rights reserved.
//

#import "Support_UsViewController.h"
#define commUrl  @"http://apis.baidu.com/heweather/weather/free"
#import "FeedbackViewController.h"
#import <MessageUI/MessageUI.h>
#import <ShareSDK/ShareSDK.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "AFNetworking.h"
#import "requireMethod.h"
@interface Support_UsViewController () <UIAlertViewDelegate,MFMailComposeViewControllerDelegate,CLLocationManagerDelegate,MKMapViewDelegate>{


    UITableView *infoTab;
    NSArray *infoTitle;
     MFMailComposeViewController *mc;
    UIImageView *imageview;
     UITextField *roadText;
    
    MKMapItem *wuHanItem;
    NSDictionary *dict;
    requireMethod *method;
}
@property (nonatomic,strong) MKMapView *mapview;
@property (nonatomic,strong) CLGeocoder *geoCoder;
@end

@implementation Support_UsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self busOnline];
    self.view.backgroundColor = [UIColor whiteColor];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
  
   
    // Do any additional setup after loading the view.
//    NSString *httpArg = @"city=beijing";
//    [self request: commUrl withHttpArg: httpArg];
    infoTitle = [NSArray arrayWithObjects:@"意见反馈",@"联系我们",@"分享",nil];
    
   
    imageview =[[UIImageView alloc]initWithFrame:CGRectMake((screenWidth-200)/2, 64, 200, 200)];
    if (IS_IPHONE5) {
         imageview =[[UIImageView alloc]initWithFrame:CGRectMake((screenWidth-100)/2, 64, 100, 100)];
    }
    imageview.userInteractionEnabled = YES;
    imageview.image = [UIImage imageNamed:@"zhifubao"];
    [self.view addSubview:imageview];
    
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(savephotos)];
    [imageview addGestureRecognizer:tap];
    
    
    UILabel *lab =[setUI creteLabelWithFrame:CGRectMake(10, imageview.bottom+10, screenWidth-20, 30) lebelText:@"单击上方图片,可扫码支持我" labelFont:[UIFont systemFontOfSize:18] labelTextAlignment:NSTextAlignmentCenter labelTextColor:[UIColor redColor] labelBackGroundColor:[UIColor whiteColor]];
    [self.view addSubview:lab];
    
    
        roadText =[[UITextField alloc]initWithFrame:CGRectMake(10, lab.bottom+10, SCREEN_WIDTH-20-40, 30)];
        roadText.placeholder =@"请输入您要去面试的地点";
        [self.view addSubview:roadText];
    
        UIButton *searchBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        searchBtn.frame =CGRectMake(roadText.right-100, roadText.top, 160, 30);
        [searchBtn setTitle:@"(⊙o⊙)…面试导航" forState:UIControlStateNormal];
        [searchBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(initMapkit) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:searchBtn];
    NSArray *titleArr =@[@"✉️   意 * 见 * 反 * 馈",@"☎️   联 * 系 * 我 * 们 ",@"🚲   告 * 诉 * 大 * 家 "];
    for (int index=0; index<3; index++) {
        UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame =CGRectMake(10, 354+40*index+20, SCREEN_WIDTH-20, 30);
        
        UIView *line =[[UIView alloc]initWithFrame:CGRectMake(10, btn.bottom, SCREEN_WIDTH-20, 0.3)];
        line.backgroundColor =[UIColor colorWithHex:0xd0d0d0];
        [self.view addSubview:line];
        [btn setTitle:[titleArr objectAtIndex:index] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//        btn.backgroundColor =[UIColor colorWithHex:0x22bba7];
        btn.tag =100+index;
        [btn addTarget:self action:@selector(getInfo:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
    }
    
 
    UITapGestureRecognizer *tap1 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideKeyBoard:)];
    [self.view addGestureRecognizer:tap1];
    
#pragma mark- 网络请求
    method =[[requireMethod alloc]init];
    [method getTheDataWithTheAPIKEY:@"29ccc26ef8dd35f44a443cfc1f0f24e8" andTheUrl:@"http://apis.baidu.com/xiaota/bus_lines/buses_lines" andUseTemp:@{@"city":@"武汉",@"direction":@"1",@"bus":@"596"} success:^(id result) {
        NSLog(@"%@",result);
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
   

    
}

-(void)getInfo:(UIButton*)sender {

    if (sender.tag ==100) {
        mc = [[MFMailComposeViewController alloc] init];
        mc.mailComposeDelegate = self;
        //设置收件人
        [mc setToRecipients:[NSArray arrayWithObjects:@"294336370@qq.com", nil]];
        
        [mc setMessageBody:@"请输入您的反馈信息" isHTML:NO];
        [self presentModalViewController:mc animated:YES];
    }
    if (sender.tag ==101) {
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"确定拨打以下电话么" message:@"15927440810" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        
        [alert show];
    }
    if (sender.tag ==102)
        {
            
            NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"Icon-iPhone-29@2x" ofType:@"png"];
            
            //构造分享内容
            id<ISSContent> publishContent = [ShareSDK content:@"点击下载"
                                               defaultContent:@"分享"
                                                        image:[ShareSDK imageWithPath:imagePath]
                                                        title:@"苹果开发助手"
                                                          url:@"https://itunes.apple.com/us/app/ping-guo-kai-fa-gong-ju/id1055378926?l=zh&ls=1&mt=8"
                                                  description:@"时间有限哦"
                                                    mediaType:SSPublishContentMediaTypeNews];
            //创建弹出菜单容器
            id<ISSContainer> container = [ShareSDK container];
            [container setIPadContainerWithView:self.view arrowDirect:UIPopoverArrowDirectionUp];
            
            //弹出分享菜单
            [ShareSDK showShareActionSheet:container
                                 shareList:nil
                                   content:publishContent
                             statusBarTips:YES
                               authOptions:nil
                              shareOptions:nil
                                    result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                        
                                        if (state == SSResponseStateSuccess)
                                        {
                                            NSLog(@"分享成功");
                                        }
                                        else if (state == SSResponseStateFail)
                                        {
                                            NSLog(@"分享失败,错误码:%ld,错误描述:%@", [error errorCode], [error errorDescription]);
                                        }
                                    }];
        }
        
    

}


-(void)hideKeyBoard:(UITapGestureRecognizer *)tap{

    [self.view endEditing:YES];

}

-(void)busOnline{

    NSString *httpUrl = @"http://apis.baidu.com/xiaota/bus_lines/buses_lines";
    NSString *utf8Str =@"武汉";
       NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)utf8Str, NULL, NULL,  kCFStringEncodingUTF8 ));
    NSString *httpArg = [NSString stringWithFormat:@"city=%@&bus=596&direction=1",encodedString];
    [self request: httpUrl withHttpArg: httpArg];


}

-(void)request: (NSString*)httpUrl withHttpArg: (NSString*)HttpArg  {
        NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", httpUrl, HttpArg];
        NSURL *url = [NSURL URLWithString: urlStr];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
        [request setHTTPMethod: @"GET"];
        [request addValue: @"29ccc26ef8dd35f44a443cfc1f0f24e8" forHTTPHeaderField: @"apikey"];
        [NSURLConnection sendAsynchronousRequest: request
                                           queue: [NSOperationQueue mainQueue]
                               completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){
                                   if (error) {
                                       NSLog(@"Httperror: %@%ld", error.localizedDescription, error.code);
                                   } else {
                                       NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
                                       NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                       NSLog(@"HttpResponseCode:%ld", responseCode);
//                                       站台数组
                                       NSArray *arr = [self dictionaryWithJsonString:responseString][@"data"][@"stations"];
//                                       
                                       NSLog(@"%@",[self dictionaryWithJsonString:responseString]);
                                   }
                               }];
}

/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
     if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableView"]) {
     return NO;
     } if ([touch.view isKindOfClass:[UITableViewCell class]]) {
         return NO;
     } return YES;

}
-(void)initMapkit {

    [self initmap];

}
/**
 *  创建导航地图
 */
-(void)initmap {

    _geoCoder=[[CLGeocoder alloc] init];
    [_geoCoder geocodeAddressString:roadText.text completionHandler:^(NSArray *placemarks, NSError *error) {
        //地理标注
        CLPlacemark *clWuHan=placemarks[0];
        //把地理标注变成地图标注
        MKPlacemark *mkWuHan=[[MKPlacemark alloc] initWithPlacemark:clWuHan];
        
        //把地图标注变成地图项
        MKMapItem *wuHanItem=[[MKMapItem alloc] initWithPlacemark:mkWuHan];
        
        NSDictionary *dict=@{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeWalking};
        
        //开始导航
        [MKMapItem openMapsWithItems:@[wuHanItem] launchOptions:dict];
        
    }];

}

- (void)savephotos {

    NSLog(@"single click %@",[imageview image]);
    UIImageWriteToSavedPhotosAlbum([imageview image], nil, nil,nil);
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"存储照片成功"
//                                                    message:@"您已将照片存储于相册中，可用支付宝进行扫描。"
//                                                   delegate:self
//                                          cancelButtonTitle:@"OK"
//                                          otherButtonTitles:nil];
//    [alert show];
    [SVProgressHUD showWithStatus:@"存储照片成功！您已将照片存储于相册中，可用支付宝进行扫描"];
    [SVProgressHUD dismissWithDelay:2.0];


}


- (void)setTableFooterView:(UITableView *)tb {
    
    if (!tb) {
        
        return;
        
    }
    
    UIView *view = [[UIView alloc] init];
    
    view.backgroundColor = [UIColor whiteColor];
    
    [tb setTableFooterView:view];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {

    if (buttonIndex == 0) {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://15927440810"]];
    }

}

- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error {
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail send canceled...");
            [SVProgressHUD showWithStatus:@"邮件发送被取消"];
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved...");
            [SVProgressHUD showWithStatus:@"邮件保存到草稿箱"];
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent...");
            [SVProgressHUD showWithStatus:@"正在发送成功"];
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail send errored: %@...", [error localizedDescription]);
            [SVProgressHUD showWithStatus:@"正在发送失败"];
            break;
        default:
            break;
    }
//    [MBProgressHUD showSuccess:@"邮件发送成功，稍后会和您联系"];
    [SVProgressHUD dismissWithDelay:1.0];
    [self dismissModalViewControllerAnimated:YES];
    
}

//-(void)request: (NSString*)httpUrl withHttpArg: (NSString*)HttpArg  {
//    
//    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", httpUrl, HttpArg];
//    NSURL *url = [NSURL URLWithString: urlStr];
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
//    [request setHTTPMethod: @"GET"];
//    [request addValue: @"29ccc26ef8dd35f44a443cfc1f0f24e8" forHTTPHeaderField: @"apikey"];
//    [NSURLConnection sendAsynchronousRequest: request
//                                       queue: [NSOperationQueue mainQueue]
//                           completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){
//                               if (error) {
//                                   NSLog(@"Httperror: %@%ld", error.localizedDescription, error.code);
//                               } else {
//                                   NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
//                                   NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//                                   NSLog(@"HttpResponseCode:%ld", responseCode);
//                                   NSLog(@"HttpResponseBody %@",responseString);
//                               }
//                           }];
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 50.0;

}

@end
