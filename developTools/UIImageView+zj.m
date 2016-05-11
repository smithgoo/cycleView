//
//  UIImageView+zj.m
//  GCD
//
//  Created by Kpeng on 15/8/18.
//  Copyright (c) 2015年 Kpeng. All rights reserved.
//

#import "UIImageView+zj.h"

@implementation UIImageView (zj)
- (void)setImageWithURL:(NSURL*)url {
    
    dispatch_queue_t queue =dispatch_queue_create("webimage", NULL);
    dispatch_async(queue, ^{
        
        NSData *data =[NSData dataWithContentsOfURL:url];
        UIImage *image =[UIImage imageWithData:data];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            self.image = image;
        });
        
    });
    
    
}
- (void)setImageWithURL:(NSURL*)url PlaceHolder:(UIImage*)img {
    
    dispatch_queue_t queue =dispatch_queue_create("webimage", NULL);
    dispatch_async(queue, ^{
        
        NSData *data =[NSData dataWithContentsOfURL:url];
        UIImage *image =[UIImage imageWithData:data];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (image ==nil) {
                self.image = img;
            } else {
            self.image = image;
            }
        });
        
    });


}

@end
