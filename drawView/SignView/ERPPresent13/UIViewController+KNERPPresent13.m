//
//  UIViewController+KNERPPresent13.m
//  drawView
//
//  Created by mac on 2020/11/6.
//  Copyright © 2020 https://kunnan.blog.csdn.net        . All rights reserved.
//

#import <objc/runtime.h>


#import "UIViewController+KNERPPresent13.h"

static const char *K_automaticallySetModalPresentationStyleKey;


@implementation UIViewController (KNERPPresent13)



+ (void)load {
    Method originAddObserverMethod = class_getInstanceMethod(self, @selector(presentViewController:animated:completion:));
    Method swizzledAddObserverMethod = class_getInstanceMethod(self, @selector(K_presentViewController:animated:completion:));
    method_exchangeImplementations(originAddObserverMethod, swizzledAddObserverMethod);
    
    
    
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
            NSArray *selStringsArray = @[@"shouldAutorotate",@"supportedInterfaceOrientations",@"preferredInterfaceOrientationForPresentation"];
            
            
            [selStringsArray enumerateObjectsUsingBlock:^(NSString *selString, NSUInteger idx, BOOL *stop) {
                NSString *mySelString = [@"sd_" stringByAppendingString:selString];
                
                Method originalMethod = class_getInstanceMethod(self, NSSelectorFromString(selString));
                Method myMethod = class_getInstanceMethod(self, NSSelectorFromString(mySelString));
                method_exchangeImplementations(originalMethod, myMethod);
            }];
        });
    

}

- (void)setK_automaticallySetModalPresentationStyle:(BOOL)K_automaticallySetModalPresentationStyle {
    
    objc_setAssociatedObject(self, K_automaticallySetModalPresentationStyleKey, @(K_automaticallySetModalPresentationStyle), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)K_automaticallySetModalPresentationStyle {
    id obj = objc_getAssociatedObject(self, K_automaticallySetModalPresentationStyleKey);
    if (obj) {
        return [obj boolValue];
    }
    return [self.class K_automaticallySetModalPresentationStyle];
}

+ (BOOL)K_automaticallySetModalPresentationStyle {
    if ([self isKindOfClass:[UIImagePickerController class]] || [self isKindOfClass:[UIAlertController class]]) {
        return NO;
    }
    return YES;
}



- (void)K_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    if (@available(iOS 13.0, *)) {
        if (viewControllerToPresent.K_automaticallySetModalPresentationStyle) {
            
            
            viewControllerToPresent.modalPresentationStyle = [QCTSession getModalPresentationStyleWith:viewControllerToPresent];
            
            
            
//            viewControllerToPresent.modalPresentationStyle = UIModalPresentationOverFullScreen;// 1、后果：被怼了很惨，因为项目里有很多模态出来的VC是半透明，结果现在变成完全不透明，背景为黑色。2、 修复拜访记录日期控件PGDatePicker蒙版的问题：点击时间输入框，弹窗蒙版变成了空白

//                        viewControllerToPresent.modalPresentationStyle = UIModalPresentationAutomatic;// 1、后果：被怼了很惨，因为项目里有很多模态出来的VC是半透明，结果现在变成完全不透明，背景为黑色。2、 修复拜访记录日期控件PGDatePicker蒙版的问题：点击时间输入框，弹窗蒙版变成了空白

            //            2、后遗症：因为把显示效果修改为：UIModalPresentationOverFullScreen；半透明，全屏覆盖的问题都得到完美解决。但是会引发一个新的问题：前一个页面的viewWillAppear:、viewDidAppear:也无法触发。例如： A   Present  B, 有时因为业务逻辑需要，必须在viewWillAppear， viewDidAppear里写一些代码，当B 调用dismiss方法的时候， A的这个两个方法不会触发，因此会有一些安全隐患。因此如果要求B 调用dismiss方法，A要执行viewWillAppear:、viewDidAppear:这个两个方法，这个时候要把B的modalPresentationStyle设置为：UIModalPresentationFullScreen；

                        
            //      3、      其他：如果要求 B既要半透明，dismiss时，A还要调用viewWillAppear:、viewDidAppear:。我的想法是在B 写一个block，在B调用dismiss之前，利用block回调A相关的业务逻辑代码。如果有其他更好的方法请告诉我。万分感谢！！
                        

            
        }
        [self K_presentViewController:viewControllerToPresent animated:flag completion:completion];
    } else {
        // Fallback on earlier versions
        [self K_presentViewController:viewControllerToPresent animated:flag completion:completion];
    }
}

#pragma mark - ******** 2、【如果用户有打开手机的自动旋转功能 除了签名界面的页面，其余的都是竖屏】：

- (BOOL)sd_shouldAutorotate{
    return YES;
}


- (UIInterfaceOrientationMask)sd_supportedInterfaceOrientations {
    
    return UIInterfaceOrientationMaskPortrait;
}
-(UIInterfaceOrientation)sd_preferredInterfaceOrientationForPresentation{
    
    return UIInterfaceOrientationPortrait;
}
- (BOOL)shouldAutorotate {
    //CRMSignatureViewController4EditMerchantInfo
    //判断类型，签名的上一个界面需要自动旋转回来

    return YES;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}
//


@end
