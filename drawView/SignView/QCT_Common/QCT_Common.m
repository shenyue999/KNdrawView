//
//  QCT_Common.m
//  drawView
//
//  Created by mac on 2020/11/5.
//  Copyright © 2020 https://kunnan.blog.csdn.net        . All rights reserved.
//

#import "QCT_Common.h"

@implementation QCT_Common

+(void)setupUIInterfaceOrientationLandscapeRight{
    
//    - (void)createView{
//        [self signV];// 先执行自动约束，在切换横屏

            //push过来，设置横屏
            NSNumber *orientationUnknown = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
            [[UIDevice currentDevice] setValue:orientationUnknown forKey:@"orientation"];

            NSNumber *orientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
            [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];

            //初始化，在设置横屏后布局，否则获取的是横屏状态下的size
        
//    }


}




+(void)setupUIInterfaceOrientationMaskPortrait{
    
    
            //push过来，设置竖屏
            NSNumber *orientationUnknown = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
            [[UIDevice currentDevice] setValue:orientationUnknown forKey:@"orientation"];

            NSNumber *orientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationMaskPortrait];
            [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];


}

@end
