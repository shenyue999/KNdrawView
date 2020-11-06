//
//  UIBarButtonItem+Extension.h
//  HWeibo
//
//  Created by devzkn on 6/28/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (UIBarButtonItem*)newbarButtonItemWithTarget:(id)target Image:(NSString*)imageName highlightedImage:(NSString*)highlightedImage actionMethod:(SEL)actionMethod;

    
+ (UIBarButtonItem*)barButtonItemWithTarget:(id)target Image:(NSString*)imageName highlightedImage:(NSString*)highlightedImage actionMethod:(SEL)actionMethod;


+ (UIBarButtonItem*)barButtonItemWithTarget:(id)target Image:(NSString*)imageName highlightedImage:(NSString*)highlightedImage actionMethod:(SEL)actionMethod size:(CGSize)size;

+ (UIBarButtonItem*)barButtonItemWithTarget:(id)target Image:(NSString*)imageName highlightedImage:(NSString*)highlightedImage actionMethod:(SEL)actionMethod   selectedImageName:(NSString*)selectedImageName;

@end
