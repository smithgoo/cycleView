//
//  InfoCollectionViewCell.m
//  developTools
//
//  Created by Kpeng on 15/10/30.
//  Copyright © 2015年 Kpeng. All rights reserved.
//

#import "InfoCollectionViewCell.h"

@implementation InfoCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.pic = [[UIImageView alloc]initWithFrame:CGRectMake(15, 0,120 , 120)];
    [self addSubview:self.pic];
    
    self.ttLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 120, 150, 30)];
    self.ttLab.textAlignment = NSTextAlignmentCenter;
    self.ttLab.textColor =[UIColor redColor];
    [self addSubview:self.ttLab];
    
    
    
}

@end
