//
//  UIButton+image.m
//  GCD
//
//  Created by Kpeng on 15/8/25.
//  Copyright (c) 2015年 Kpeng. All rights reserved.
//

#import "UIButton+image.h"

@implementation UIButton (image)

- (void)setBtnBackGroundImgWithURL:(NSURL*)url{
    
    dispatch_queue_t queue =dispatch_queue_create("button", NULL);
    dispatch_async(queue, ^{
        NSData *data =[NSData dataWithContentsOfURL:url];
        UIImage *image =[UIImage imageWithData:data];
        [self setBackgroundImage:image forState:UIControlStateNormal];
        
    });
    
}

@end
