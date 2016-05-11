//
//  requireMethod.h
//  developTools
//
//  Created by Kpeng on 16/3/25.
//  Copyright © 2016年 Kpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface requireMethod : NSObject
//get带参数
- (void)getHealthInterventionsInfo:(NSDictionary *)HealthInterventionsInfo success:(void(^)(id result))success failure:(void(^)(NSError *errer))failure;
//get带参数 带链接
-(void)getTheResult:(NSString *)url withTemDic:(NSDictionary *)dic success:(void(^)(id result))success failure:(void(^)(NSError *error))faile;
//pot 带参数
-(void)postTheData:(NSDictionary *)dic success:(void(^)(id result))success failure:(void(^)(NSError *error))failure ;
//添加apikey的头参数的请求
-(void)getTheDataWithTheAPIKEY:(NSString *)Apikey andTheUrl:(NSString *)url andUseTemp:(NSDictionary *)dic success:(void(^)(id result))success failure:(void(^)(NSError *error))failure ;
@end
