//
//  QCT_Common.h
//  drawView
//
//  Created by mac on 2020/11/5.
//  Copyright © 2020 https://kunnan.blog.csdn.net        . All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QCT_Common : NSObject
//设置横屏
+(void)setupUIInterfaceOrientationLandscapeRight;
/**
 设置竖屏
 */
+(void)setupUIInterfaceOrientationMaskPortrait;

@end

NS_ASSUME_NONNULL_END
