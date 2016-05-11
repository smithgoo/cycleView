//
//  AppDelegate.m
//  developTools
//
//  Created by Kpeng on 15/10/20.
//  Copyright © 2015年 Kpeng. All rights reserved.
//

#import "AppDelegate.h"
#import "Support_UsViewController.h"
#import "MainTabBarViewController.h"
#import "LanguageViewController.h"
#import "UIDesignViewController.h"
#import "Knowledge_of_difficultiesViewController.h"
#import "Interview_questionsViewController.h"
#import "GuidgeViewController.h"
#import "TipsViewController.h"
#import <ShareSDK/ShareSDK.h>
#import "WXApi.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/TencentOAuthObject.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/QQApiInterfaceObject.h>
#import <TencentOpenAPI/sdkdef.h>
//#import "WeiboSDK.h"

//#import <TencentOpenAPI/QQApi.h>
//#import <TencentOpenAPI/QQApiInterface.h>

//#import <QZoneConnection/ISSQZoneApp.h>
//#import <TencentOpenAPI/TencentOAuth.h>
@interface AppDelegate () {

      MainTabBarViewController *main ;

}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window =[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds ]];
    
//微信分享
    [ShareSDK registerApp:shareKey];
    [self initializePlat];

   
        UILabel  * label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width , UIScreen.mainScreen.bounds.size.height)];
        label1.text = @"qingjoin";    [self.window addSubview:label1];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        [UIView setAnimationDuration:3.0];
        [UIView setAnimationDelegate:self];
        label1.alpha =0.0;
        [UIView commitAnimations];//
        [self.window addSubview:label1];
        
        
//        MainTabBarViewController *tb =[[MainTabBarViewController alloc]init];
    TipsViewController *tips =[[TipsViewController alloc]init];
    
        UINavigationController *navi =[[UINavigationController alloc]initWithRootViewController:tips];
    
        
        self.window.rootViewController = navi;

    
        [self.window makeKeyAndVisible];
    [self reach];//网络状态

    return YES;
}


-(void)initializePlat
{
    /**
     连接微信应用以使用相关功能，此应用需要引用WeChatConnection.framework和微信官方SDK
     http://open.weixin.qq.com上注册应用，并将相关信息填写以下字段
    **/

    [ShareSDK connectWeChatWithAppId:KWechat_key
                           appSecret:KWechat_secret
                           wechatCls:[WXApi class]];
    //微信朋友圈
    [ShareSDK connectWeChatTimelineWithAppId:KWechat_key
                                   appSecret:KWechat_secret
                                   wechatCls:[WXApi class]];
    /**
     连接新浪微博开放平台应用以使用相关功能，此应用需要引用SinaWeiboConnection.framework
     http://open.weibo.com上注册新浪微博开放平台应用，并将相关信息填写到以下字段
     **/
//    [ShareSDK connectSinaWeiboWithAppKey:kWeiboAppkey
//                               appSecret:kWeiboSecret
//                             redirectUri:kRedirectUri];
//    /**
//     连接QQ应用以使用相关功能，此应用需要引用QQConnection.framework和QQApi.framework库
//     http://mobile.qq.com/api/上注册应用，并将相关信息填写到以下字段
//     **/
//    [ShareSDK connectQQWithQZoneAppKey:kQQAppkey
//                     qqApiInterfaceCls:[QQApiInterface class]
//                       tencentOAuthCls:[TencentOAuth class]];
    /**
//     连接QQ空间应用以使用相关功能，此应用需要引用QZoneConnection.framework
//     http://connect.qq.com/intro/login/上申请加入QQ登录，并将相关信息填写到以下字段
//     
//     如果需要实现SSO，需要导入TencentOpenAPI.framework,并引入QQApiInterface.h和TencentOAuth.h，将QQApiInterface和TencentOAuth的类型传入接口
//     **/
//    [ShareSDK connectQZoneWithAppKey:kQQAppkey
//                           appSecret:kQQSecret
//                   qqApiInterfaceCls:[QQApiInterface class]
//                     tencentOAuthCls:[TencentOAuth class]];
//    
//    //短信
//    [ShareSDK connectSMS];
    
}

/**
 *  请求网络状态
 */

- (void)reach
{
    /**
     AFNetworkReachabilityStatusUnknown          = -1,  // 未知
     AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
     AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G 花钱
     AFNetworkReachabilityStatusReachableViaWiFi = 2,   // 局域网络,不花钱
     */
    // 如果要检测网络状态的变化,必须用检测管理器的单例的startMonitoring
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"网络状态%d", status);
        if (status  == 1) {
            NSLog(@"AFNetworkReachabilityStatusReachableViaWWAN");
        }
        if (status == 0) {
            NSLog(@"AFNetworkReachabilityStatusNotReachable");

        }
        if (status ==-1) {
            NSLog(@"AFNetworkReachabilityStatusUnknown");
        }
        if (status == 2) {
             NSLog(@"AFNetworkReachabilityStatusReachableViaWiFi");
        }
        
    }];
}

#pragma mark - ShareSDK必须执行的方法
//10.30 add by xgf
-(BOOL)application:(UIApplication *)application
     handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url
                        wxDelegate:self];
}

-(BOOL)application:(UIApplication *)application
           openURL:(NSURL *)url
 sourceApplication:(NSString *)sourceApplication
        annotation:(id)annotation
{
    return [ShareSDK handleOpenURL:url
                 sourceApplication:sourceApplication
                        annotation:annotation
                        wxDelegate:self];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "smithgoo.developTools" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"developTools" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"developTools.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
