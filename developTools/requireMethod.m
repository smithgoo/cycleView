//
//  requireMethod.m
//  developTools
//
//  Created by Kpeng on 16/3/25.
//  Copyright © 2016年 Kpeng. All rights reserved.
//

#import "requireMethod.h"
#import "AFNetworking.h"
#define commemdURl @""
#define userURL @""
@implementation requireMethod {

    AFHTTPSessionManager *mag;
}

/**
 *  @author 王朋, 16-03-25 14:03:57
 *
 *  @brief 只用传参数的 get
 
 示例  @"http://jkda.998jk.com/mobile/banner/selectAllBannerImages.json"

 */
- (void)getHealthInterventionsInfo:(NSDictionary *)HealthInterventionsInfo success:(void(^)(id result))success failure:(void(^)(NSError *error))failure{
    mag =[AFHTTPSessionManager manager];
    
    mag.responseSerializer.acceptableContentTypes =[NSSet setWithObject:@"text/html"];
    [mag GET:commemdURl parameters:HealthInterventionsInfo success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];

}

/**
 *  @author 王朋, 16-03-25 14:03:57
 *
 *  @brief  传参数的 和链接 的 get
 
 示例  @"http://jkda.998jk.com/mobile/banner/selectAllBannerImages.json"
 
 */

-(void)getTheResult:(NSString *)url withTemDic:(NSDictionary *)dic success:(void(^)(id result))success failure:(void(^)(NSError *error))faile {

    mag =[AFHTTPSessionManager manager];
    [mag GET:[NSString stringWithFormat:@"%@%@",commemdURl,url] parameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        faile(error);
    }];

}

/**
 *  @author 王朋, 16-03-25 14:03:57
 *
 *  @brief 只用传参数的 post
 
 示例  @"http://jkda.998jk.com/mobile/banner/selectAllBannerImages.json"
 
 */

-(void)postTheData:(NSDictionary *)dic success:(void(^)(id result))success failure:(void(^)(NSError *error))failure {
    mag =[AFHTTPSessionManager manager];
    [mag POST:commemdURl parameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];


}

/**
 *  @author 王朋, 16-03-25 16:03:06
 *
 *  @brief 添加appkey的头文件
 *
 *  @param Apikey  <#Apikey description#>
 *  @param url     <#url description#>
 *  @param dic     <#dic description#>
 *  @param success <#success description#>
 *  @param failure <#failure description#>

 */

-(void)getTheDataWithTheAPIKEY:(NSString *)Apikey andTheUrl:(NSString *)url andUseTemp:(NSDictionary *)dic success:(void(^)(id result))success failure:(void(^)(NSError *error))failure {
    mag =[AFHTTPSessionManager manager];
    [mag.requestSerializer setValue:Apikey forHTTPHeaderField:@"apikey"];
    [mag POST:url parameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];

    

}


@end
