//
//  HWNavigationController.h
//  HWeibo
//
//  Created by devzkn on 6/27/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIBarButtonItem+Extension.h"

#import "ImageTools.h"

@interface HWNavigationController : UINavigationController

+ (void) setttingAppearance;

- (void)setupNavigationBarBarStyle:(NSInteger)barStyle;
#pragma mark - ******** 设置列表控制器的样式
+ (void)setupListnavigationItemAndBarStyle:(UIViewController*)vc;
+ (void)setupDetailnavigationItemAndBarStyle:(UIViewController*)vc;
@end
