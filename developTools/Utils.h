//
//  Utils.h
//  
//
//  Created by someone on 14-9-3.
//  Copyright (c) 2014年 ontoweb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@class GDataXMLElement;

@interface Utils : NSObject

//检测网络是否连接
+ (BOOL)isNetworkAvailable;

+ (BOOL)isSystemVersion7;


//获取用户名
+(NSString *)getUser;

+(NSString *)getUserNO;

+(void) showNotice:(NSString *) noticeInfo;

+(void) showNoticeWithTitle:(NSString *)title   andMessage:(NSString *) noticeInfo;
//跳转到 Main.storyboard里面的页面
+(void) jumpToMainStbController:(NSString *)identifier atTarget:(id)Id;
//跳转到 Functions.syoryboard里面的页面
+(void) jumpToFunctionsStbController:(NSString *)identifier atTarget:(id)Id;
//跳转到 Functions1.syoryboard里面的页面
+(void) jumpToFunctions1StbController:(NSString *)identifier atTarget:(id)Id;

+(void) jumpToStbController:(NSString *)identifier inStoryboard:(NSString *)stbStr atTarget:(id)Id;

//正则式判断电话号码
+ (BOOL)validateMobile:(NSString *)mobileNum;
//判断输入的邮箱格式是否正确
+(BOOL)checkEmail:(NSString*)email;
//判断输入的qq格式是否正确
+(BOOL)checkQQ:(NSString*)qq;
//判断输入的身份证号格式是否正确
+(BOOL)checkIdCard:(NSString*)ID;
//判断输入的内容只能为数字
+(BOOL)checkOnlyNum:(NSString*)ID;


+(NSString *)getCurrentTimeWithFormat;

+(NSString *)getRealXML:(NSString *)xml;

+(NSString *)getRandomId;

+(BOOL)compareDateStr1:(NSString *)str1 withDateStr2:(NSString *)str2;

+ (float)getIOSVersion;

@end
