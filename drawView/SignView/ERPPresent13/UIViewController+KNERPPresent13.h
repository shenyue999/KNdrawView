//
//  UIViewController+KNERPPresent13.h
//  drawView
//
//  Created by mac on 2020/11/6.
//  Copyright © 2020 https://kunnan.blog.csdn.net        . All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (KNERPPresent13)
/**
Whether or not to set ModelPresentationStyle automatically for instance, Default is [Class K_automaticallySetModalPresentationStyle].
@return BOOL
*/
@property (nonatomic, assign) BOOL K_automaticallySetModalPresentationStyle;

/**
 Whether or not to set ModelPresentationStyle automatically, Default is YES, but UIImagePickerController/UIAlertController is NO.
 @return BOOL
 */
+ (BOOL)K_automaticallySetModalPresentationStyle;



@end

NS_ASSUME_NONNULL_END
