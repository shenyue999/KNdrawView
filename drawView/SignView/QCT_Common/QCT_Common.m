//
//  QCT_Common.m
//  drawView
//
//  Created by mac on 2020/11/5.
//  Copyright © 2020 https://kunnan.blog.csdn.net        . All rights reserved.
//

#import "QCT_Common.h"

@implementation QCT_Common


+(void)setupUIInterfaceOrientationMaskPortrait{
    
    
            //push过来，设置横屏
            NSNumber *orientationUnknown = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
            [[UIDevice currentDevice] setValue:orientationUnknown forKey:@"orientation"];

            NSNumber *orientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationMaskPortrait];
            [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];


}

@end
