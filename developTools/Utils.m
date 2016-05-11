//
//  Utils.m
//  
//
//  Created by someone on 14-9-3.
//  Copyright (c) 2014年 ontoweb. All rights reserved.
//

#import "Utils.h"
#import <UIKit/UIKit.h>
#define  KEY_LOGIN_USERNO  @"userNo"
#define  KEY_LOGIN_USER  @"userName"

@implementation Utils

+ (BOOL)isNetworkAvailable {
	
	BOOL isAvailable = '\0';
	
	Reachability *r = [Reachability reachabilityWithHostname:@"www.baidu.com"];
	
	switch ([r currentReachabilityStatus]) {
            
		case NotReachable:
			isAvailable = NO;
			break;
		case ReachableViaWiFi:
		case ReachableViaWWAN:
			isAvailable = YES;
			break;
	}
	
	return isAvailable;
}

+ (BOOL)isSystemVersion7{
    if ([[[UIDevice currentDevice]systemVersion]floatValue]>= 7.0)
        return YES;
    else
        return NO;
}


//获取登录时的用户名
+(NSString *)getUser{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * userName = [userDefaults objectForKey:KEY_LOGIN_USER];
    if (!userName) {
        return nil;
    }else
    {
        return userName;
    }
}

//
+(NSString *)getUserNO{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * userNO = [userDefaults objectForKey:KEY_LOGIN_USERNO];
    if (!userNO) {
        return nil;
    }else
        return userNO;
}


+(void) showNotice : (NSString *) noticeInfo
{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@""
                          message:noticeInfo
                          delegate:self
                          cancelButtonTitle:@"确定"
                          otherButtonTitles:nil];
    [alert show];
}

+(void) showNoticeWithTitle:(NSString *)title andMessage:(NSString *) noticeInfo{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:title
                          message:noticeInfo
                          delegate:self
                          cancelButtonTitle:@"确定"
                          otherButtonTitles:nil];
    [alert show];
}

+(void) jumpToMainStbController:(NSString *)identifier atTarget:(id)Id{
    UIStoryboard * main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *controller = [main instantiateViewControllerWithIdentifier:identifier];
    controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [Id presentViewController:controller animated:YES completion:nil];
}

+(void) jumpToFunctionsStbController:(NSString *)identifier atTarget:(id)Id{
    UIStoryboard * functions = [UIStoryboard storyboardWithName:@"Functions" bundle:nil];
    UIViewController *controller = [functions instantiateViewControllerWithIdentifier:identifier];
    controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [Id presentViewController:controller animated:YES completion:nil];
}

+(void) jumpToFunctions1StbController:(NSString *)identifier atTarget:(id)Id
{
    UIStoryboard * functions = [UIStoryboard storyboardWithName:@"Functions1" bundle:nil];
    UIViewController *controller = [functions instantiateViewControllerWithIdentifier:identifier];
    controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [Id presentViewController:controller animated:YES completion:nil];
}

+(void) jumpToStbController:(NSString *)identifier inStoryboard:(NSString *)stbStr atTarget:(id)Id
{
    UIStoryboard * functions = [UIStoryboard storyboardWithName:stbStr bundle:nil];
    UIViewController *controller = [functions instantiateViewControllerWithIdentifier:identifier];
    controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [Id presentViewController:controller animated:YES completion:nil];
}

+ (BOOL)validateMobile:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
//判断输入的邮箱格式是否正确
+(BOOL)checkEmail:(NSString*)email
{
    NSString *Regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *Test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    return [Test evaluateWithObject:email];
}
//判断输入的qq格式是否正确
+(BOOL)checkQQ:(NSString*)qq
{
    NSString *Regex = @"^[1-9](\\d){4,9}$";
    NSPredicate *Test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    return [Test evaluateWithObject:qq];
}
//判断输入的身份证号格式是否正确
+(BOOL)checkIdCard:(NSString*)ID
{
    NSString *Regex = @"(^\\d{15}$)|(^\\d{17}([0-9]|X)$)";
    NSPredicate *Test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    return [Test evaluateWithObject:ID];
}
//判断输入的内容只能为数字
+(BOOL)checkOnlyNum:(NSString*)Num
{
    NSString *Regex = @"^[0-9]*$";
    NSPredicate *Test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    return [Test evaluateWithObject:Num];
}


+(NSString *)getCurrentTimeWithFormat{
    NSDate * date = [NSDate date];
    NSDateFormatter  * format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString * timeStr = [format stringFromDate:date];
    return timeStr;
}

+(NSString *)getRealXML:(NSString *)xml{
    NSRange range1 = [xml rangeOfString:@"<"];
    NSString * temp = [xml substringFromIndex:range1.length + range1.location];
    NSRange range2 = [temp rangeOfString:@"<"];
    temp = [temp substringFromIndex:range2.length + range2.location -1];
    //    NSLog(@"real xml :%@",temp);
    return temp;
}

//三位随机码 + 13位时间构成的标识码，重复机率极低
+(NSString *)getRandomId{
    NSString * uid = nil;
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    NSString *temp = [NSString stringWithFormat:@"%lf",time*1000];
    temp = [temp substringToIndex:13];
    
    NSInteger ranValue =  (arc4random() % 998) ;
    if (ranValue<100) {
        ranValue = ranValue + 100;
    }
    
    NSString * ranStr = [NSString stringWithFormat:@"%ld",ranValue];
    
    uid = [ranStr stringByAppendingString:temp];
    NSLog(@"%@",uid);
    return uid;
}
//比较时间字符串, str1 在str2前面则 YES
+(BOOL)compareDateStr1:(NSString *)str1 withDateStr2:(NSString *)str2{
    NSDateFormatter * dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * date1 = [dateformatter dateFromString:str1];
    NSDate * date2 = [dateformatter dateFromString:str2];
    
    switch ([date1 compare:date2]) {
        case NSOrderedSame:
            NSLog(@"same");
            return NO;
        case NSOrderedAscending:
//            NSLog(@"date1 is earlier than date2");
            return YES;
        case NSOrderedDescending:
//            NSLog(@"date1 is later than date2");
            return NO;
            break;
        default:
//            NSLog(@"Bad date");
            return YES;
    }
}

+ (float)getIOSVersion
{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

@end
