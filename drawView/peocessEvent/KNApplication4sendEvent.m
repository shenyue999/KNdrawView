//
//  KNApplication4sendEvent.m
//  drawView
//
//  Created by mac on 2020/11/3.
//  Copyright © 2020 https://kunnan.blog.csdn.net        . All rights reserved.
////获取在屏幕上的点击坐标


#import "KNApplication4sendEvent.h"


@interface KNApplication4sendEvent ()

//对滑动和多点触控做标记
@property(nonatomic,assign) BOOL isMoved;


@end

@implementation KNApplication4sendEvent
//获取在屏幕上的点击坐标

- (void)sendEvent:(UIEvent *)event{
    if (event.type==UIEventTypeTouches) {
        UITouch *touch = [event.allTouches anyObject];
        
        if (touch.phase == UITouchPhaseBegan) {
            self.isMoved = NO;
        }
        
//        if (touch.phase == UITouchPhaseMoved) {//滑动
//            self.isMoved = YES;
//        }
        
        if (touch.phase == UITouchPhaseEnded) {
            
            
            if (!self.isMoved && event.allTouches.count == 1) {//非多点触控，非滑动
                
                
                UITouch *touch = [event.allTouches anyObject];
                
                //在屏幕上的点击坐标
                CGPoint locationPointWindow = [touch preciseLocationInView:touch.window];//touch.view
                
                
                
                NSLog(@"TouchLocationWindow:(%.1f,%.1f)",locationPointWindow.x,locationPointWindow.y);
                
                
            }
            self.isMoved = NO;
        }
    }
    [super sendEvent:event];
}

@end
