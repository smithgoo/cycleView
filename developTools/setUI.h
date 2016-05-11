//
//  setUI.h
//  developTools
//
//  Created by Kpeng on 15/10/26.
//  Copyright © 2015年 Kpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface setUI : NSObject

+ (UILabel *)creteLabelWithFrame:(CGRect)frame lebelText:(NSString *)textString labelFont:(UIFont *)font labelTextAlignment:(NSTextAlignment)textAlign labelTextColor:(UIColor *)textColor labelBackGroundColor:(UIColor*)backGround;

+ (UIButton *)createButtonWithFrame:(CGRect)frame
               buttonTitleLabelText:(NSString *)titleString
                     buttonTextFont:(UIFont *)textFont
                    buttonTextColor:(UIColor *)textColor
              buttonTitleEdgeInsets:(UIEdgeInsets)edgeInsets;

+ (UIView *)createViewWithFrame:(CGRect)frame
                 viewBackground:(UIColor *)backgroundColor;

+ (UIImageView *)createImageViewWithFrame:(CGRect)frame
                      imageViewBackground:(UIColor *)backgroundColor
                          backGroundImgae:(UIImage *)image;


+ (UIScrollView *)createScrollViewWithFrame:(CGRect)frame
                           setContentOffSet:(CGPoint)contentOffSet
                             setContentSize:(CGSize)contentSize
                                 setBounces:(BOOL)bounces
                                pageEnabled:(BOOL)pageEnabled;

+ (UITextField *)createTextFieldWithFrame:(CGRect)frame
                          TextBorderStyle:(UITextBorderStyle)borderStyle
                            TextAlignment:(NSTextAlignment)textAlignment
                                 textFont:(UIFont *)font
                                textColor:(UIColor *)textColor
                              placeHolder:(NSString *)placeHoder
                             setLeftImage:(UIImage *)image;

@end
