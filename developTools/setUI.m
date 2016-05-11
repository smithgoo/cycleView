//
//  setUI.m
//  developTools
//
//  Created by Kpeng on 15/10/26.
//  Copyright © 2015年 Kpeng. All rights reserved.
//

#import "setUI.h"


@implementation setUI

+ (UILabel *)creteLabelWithFrame:(CGRect)frame lebelText:(NSString *)textString labelFont:(UIFont *)font labelTextAlignment:(NSTextAlignment)textAlign labelTextColor:(UIColor *)textColor labelBackGroundColor:(UIColor*)backGround {

    if ([textString isKindOfClass:[NSNull class]]) {
        textString = @"";
    }
    K_CreateObjectInit(UILabel, label);
    label.frame = frame;
    label.text = textString;
    label.font = font;
    label.textAlignment = textAlign;
    label.textColor = textColor;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    label.backgroundColor = backGround;
    return label;

}


+ (UIButton *)createButtonWithFrame:(CGRect)frame
               buttonTitleLabelText:(NSString *)titleString
                     buttonTextFont:(UIFont *)textFont
                    buttonTextColor:(UIColor *)textColor
              buttonTitleEdgeInsets:(UIEdgeInsets)edgeInsets{
    
    UIButton  *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = frame;
    [button setTitle:titleString forState:UIControlStateNormal];
    button.titleLabel.font = textFont;
    [button setTitleColor:textColor forState:UIControlStateNormal];
    button.titleEdgeInsets = edgeInsets;
    button.layer.cornerRadius = 6;
    return button;
}


+ (UIView *)createViewWithFrame:(CGRect)frame
                 viewBackground:(UIColor *)backgroundColor{
    
    K_CreateObjectInit(UIView, view);
    view.frame = frame;
    view.backgroundColor = backgroundColor;
    return view;
}



+ (UIImageView *)createImageViewWithFrame:(CGRect)frame
                      imageViewBackground:(UIColor *)backgroundColor
                          backGroundImgae:(UIImage *)image{
    
    K_CreateObjectInit(UIImageView, imageView);
    imageView.frame = frame;
    imageView.backgroundColor = backgroundColor;
    imageView.image = image;
    imageView.userInteractionEnabled = YES;
    return imageView;
}

/*!
 *  创建UIScrollView
 */

+ (UIScrollView *)createScrollViewWithFrame:(CGRect)frame
                           setContentOffSet:(CGPoint)contentOffSet
                             setContentSize:(CGSize)contentSize
                                 setBounces:(BOOL)bounces
                                pageEnabled:(BOOL)pageEnabled{
    
    K_CreateObjectInit(UIScrollView, scrollView);
    scrollView.frame = frame;
    scrollView.contentOffset = contentOffSet;
    scrollView.contentSize = contentSize;
    scrollView.bounces = bounces;
    scrollView.pagingEnabled = pageEnabled;
    return scrollView;
}

/*!
 *  创建UITextField
 */

+ (UITextField *)createTextFieldWithFrame:(CGRect)frame
                          TextBorderStyle:(UITextBorderStyle)borderStyle
                            TextAlignment:(NSTextAlignment)textAlignment
                                 textFont:(UIFont *)font
                                textColor:(UIColor *)textColor
                              placeHolder:(NSString *)placeHoder
                             setLeftImage:(UIImage *)image{
    
    K_CreateObjectInit(UITextField, textField);
    textField.frame = frame;
    textField.borderStyle = borderStyle;
    textField.textAlignment = textAlignment;
    textField.font = font;
    textField.textColor = textColor;
    textField.placeholder = placeHoder;
    
    textField.leftViewMode = UITextFieldViewModeUnlessEditing;
    
    if (image) {
        CGRect rect = CGRectMake(20, 20, 30, 30);
        UIView *leftImage = [[UIView alloc] initWithFrame:rect];
        leftImage.backgroundColor = [UIColor colorWithPatternImage:image];
        textField.leftView = leftImage;
        textField.leftViewMode = UITextFieldViewModeAlways;
    }
    return textField;
}




@end
