//
//  QCTSession.h
//  drawView
//
//  Created by mac on 2020/11/6.
//  Copyright © 2020 https://kunnan.blog.csdn.net        . All rights reserved.
//
#import "HSSingleton.h"

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QCTSession : NSObject

@property (nonatomic,strong) NSMutableArray *FullScreenClasss4NavRootVC;


@property (nonatomic,strong) NSMutableArray *FullScreenClasss;
//UIModalPresentationOverCurrentContext
@property (nonatomic,strong) NSMutableArray *OverCurrentContextClasss;


HSSingletonH(QCTSession);

+ (UIModalPresentationStyle)getModalPresentationStyleWith:(UIViewController*)viewControllerToPresent;


@end

NS_ASSUME_NONNULL_END
