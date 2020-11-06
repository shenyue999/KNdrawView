//
//  UIBarButtonItem+Extension.m
//  HWeibo
//
//  Created by devzkn on 6/28/16.
//  Copyright © 2016 hisun. All rights reserved.
//
#import "UIBarButtonItem+Extension.h"
#import "UIView+Extension.h"


@implementation UIBarButtonItem (Extension)
+ (UIBarButtonItem*)barButtonItemWithTarget:(id)target Image:(NSString*)imageName highlightedImage:(NSString*)highlightedImage actionMethod:(SEL)actionMethod{
    // 设置图片
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    //设置frame
    button.size = button.currentBackgroundImage.size;
    
    
    //设置监听
    [button addTarget:target action:actionMethod forControlEvents:UIControlEventTouchUpInside];
    return  [[UIBarButtonItem alloc]initWithCustomView:button];
}

+ (UIBarButtonItem*)newbarButtonItemWithTarget:(id)target Image:(NSString*)imageName highlightedImage:(NSString*)highlightedImage actionMethod:(SEL)actionMethod{
    // 设置图片
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
//    [button setBackgroundImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    
//    [leftButton setBackgroundImage:[UIImage imageNamed:@"icon_sousuo"] forState:UIControlStateNormal];

    
    //设置frame
//    button.size = button.currentBackgroundImage.size;
    
//    button.size = CGSizeMake(kAdjustRatio(36), kAdjustRatio(36));
//    button.size = CGSizeMake(40, 40);

    //设置监听
    [button addTarget:target action:actionMethod forControlEvents:UIControlEventTouchUpInside];
    return  [[UIBarButtonItem alloc]initWithCustomView:button];
}



+ (UIBarButtonItem*)barButtonItemWithTarget:(id)target Image:(NSString*)imageName highlightedImage:(NSString*)highlightedImage actionMethod:(SEL)actionMethod size:(CGSize)size{
    // 设置图片
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    //设置frame
    button.size = size;
    [button setContentMode:UIViewContentModeCenter];
    //设置监听
    [button addTarget:target action:actionMethod forControlEvents:UIControlEventTouchUpInside];
    return  [[UIBarButtonItem alloc]initWithCustomView:button];
}






+ (UIBarButtonItem*)barButtonItemWithTarget:(id)target Image:(NSString*)imageName highlightedImage:(NSString*)highlightedImage actionMethod:(SEL)actionMethod   selectedImageName:(NSString*)selectedImageName{
    // 设置图片
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    
    if (highlightedImage != nil) {
        
        [button setBackgroundImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    }
    
    
    [button setBackgroundImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];

    //设置frame
    button.size = button.currentBackgroundImage.size;
    
    //设置监听
    [button addTarget:target action:actionMethod forControlEvents:UIControlEventTouchUpInside];
    return  [[UIBarButtonItem alloc]initWithCustomView:button];
}


@end
