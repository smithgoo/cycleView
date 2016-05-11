//
//  UIImageView+zj.h
//  GCD
//
//  Created by Kpeng on 15/8/18.
//  Copyright (c) 2015年 Kpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (zj)
- (void)setImageWithURL:(NSURL*)url;
- (void)setImageWithURL:(NSURL*)url PlaceHolder:(UIImage*)img;
@end
