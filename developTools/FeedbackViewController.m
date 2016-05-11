//
//  FeedbackViewController.m
//  developTools
//
//  Created by Kpeng on 15/10/26.
//  Copyright © 2015年 Kpeng. All rights reserved.
//

#import "FeedbackViewController.h"
#import <MessageUI/MessageUI.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "CCLocationManager.h"
@interface FeedbackViewController ()<UITextViewDelegate,MFMailComposeViewControllerDelegate> {

    UITextView *contextview;
    UILabel *titleLab ;
    UITextField *mail;
    MFMailComposeViewController *mc;
    float jingdu;
    float weidu;

}
@property (nonatomic,strong) MKMapView *mapview;
@property (nonatomic,strong) CLGeocoder *geoCoder;
@end

@implementation FeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    self.title = @"意见反馈";
    
    
//   [self initKit];
    
//    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideKeyboard)];
//    [self.view addGestureRecognizer:tap];
    
//    mc = [[MFMailComposeViewController alloc] init];
//    mc.mailComposeDelegate = self;
//    //设置收件人
//    [mc setToRecipients:[NSArray arrayWithObjects:@"294336370@qq.com", nil]];
//    
//    [mc setMessageBody:@"Watson!!!\n\nCome here, I need you!" isHTML:NO];

//    

    
//    
//    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
//    
//    btn.frame = CGRectMake(20, 74, screenWidth -40, 44);
//    [btn setTitle:@"发送反馈邮件" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    btn.backgroundColor = [UIColor redColor];
//    btn.layer.cornerRadius = 5;
//    [self.view addSubview:btn];
//    
//    [btn addTarget:self action:@selector(sendEmail) forControlEvents:UIControlEventTouchUpInside];
    
    [self initWithKit];
}

-(void)initWithKit{

    
    [[CCLocationManager shareLocation]getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
        
      jingdu  = locationCorrrdinate.latitude;
      weidu =  locationCorrrdinate.longitude;
        
    } andErrorBlock:^(NSError *error) {
        
    }];
    
    NSString *urlString = [[NSString stringWithFormat:@"http://maps.apple.com/?daddr=%f,%f&saddr=Current+Location",jingdu, weidu] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];


}
- (void)hideKeyboard {


    [self.view endEditing:YES];

}

- (void)initKit {
    
    
    mail = [[UITextField alloc]initWithFrame:CGRectMake(10, 74, screenWidth-20, 30)];
    mail.placeholder = @"请输入邮箱地址";
    mail.keyboardType =UIKeyboardTypeEmailAddress;
    
    
    
    [self.view addSubview:mail];
    
    //其次在UITextView上面覆盖个UILable,UILable设置为全局变量。
    titleLab = [[UILabel alloc]initWithFrame:CGRectMake(10, mail.bottom +10, screenWidth-20, 40)];
//    titleLab.frame =CGRectMake(10, 74, screenWidth-20, 20);
    titleLab.text = @"请输入反馈意见...";
//    titleLab.enabled = NO;//lable必须设置为不可用
    titleLab.textColor = [UIColor blackColor];
    [self.view addSubview:titleLab];
    
    
    
    UITextView *textView = [[UITextView alloc] init];
    textView.font = [UIFont systemFontOfSize:14];
    textView.frame =CGRectMake(10, titleLab.bottom +10, screenWidth-20, 150);
    textView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    textView.backgroundColor = [UIColor grayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;//设置光标位置
    [self.view addSubview:textView];
    textView.hidden = NO;
    textView.delegate = self;
    textView.layer.cornerRadius =3;
   
//    实现UITextView的代理
    
    
    
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(20, textView.bottom +10, screenWidth -40, 44);
    [btn setTitle:@"发送反馈邮件" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    btn.layer.cornerRadius = 5;
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(sendEmail) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)sendEmail {

//    if (![self validateEmail:mail.text]) {
//        
//        [MBProgressHUD showError:@"请输入正确的邮箱"];
//        return;
//    } else if (contextview.text == nil) {
//    
//        [MBProgressHUD showError:@"反馈内容不能为空"];
//    
//        return;
//    }
    
    mc = [[MFMailComposeViewController alloc] init];
        mc.mailComposeDelegate = self;
        //设置收件人
        [mc setToRecipients:[NSArray arrayWithObjects:@"294336370@qq.com", nil]];
    
        [mc setMessageBody:@"Watson!!!\n\nCome here, I need you!" isHTML:NO];
         [self presentModalViewController:mc animated:YES];


}


- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error {
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail send canceled...");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved...");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent...");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail send errored: %@...", [error localizedDescription]);
            break;
        default:
            break;
    }
    [self dismissModalViewControllerAnimated:YES];
}



- (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

//-(void)textViewDidChange:(UITextView *)textView
//{
////    self.examineText =  textView.text;
//    if (textView.text.length == 0) {
//        titleLab.text = @"请填写审批意见...";
//    }else{
//        titleLab.text = @"";
//    }
//}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
