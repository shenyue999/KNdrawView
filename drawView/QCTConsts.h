//
//  QCTConsts.h
//  drawView
//
//  Created by mac on 2020/11/6.
//  Copyright © 2020 https://kunnan.blog.csdn.net        . All rights reserved.
//
#define UIColorFromHexRGBAlpha(rgbValue,alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]
//
//
#define UIColorMakeWithHex(rgbValue) UIColorFromHexRGBAlpha(rgbValue,1.0)



#define QCT_DetailOrder_start_COLOR rgb(236,90,85)

#define QCT_DetailOrder_end_COLOR  rgb(214,50,44)

#define BASE_start_COLOR UIColorMakeWithHex(0xff4c4d)

#define BASE_end_COLOR  UIColorMakeWithHex(0xe90f1d)



extern NSString * _Nonnull const QCTNAVicon_left;


extern NSString * _Nonnull const WLGotoHWTabBarControllerTabBarIndexNotificationKey;
