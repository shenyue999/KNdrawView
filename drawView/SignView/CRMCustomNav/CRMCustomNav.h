//
//  CRMCustomNav.h
//  Housekeeper
//
//  Created by mac on 2020/3/16.
//  Copyright © 2020 QCT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CRMCustomNav : UIView


@property (nonatomic,weak) UILabel *titleLab;

@property (nonatomic,weak) UIButton *titleBtn;

@property (nonatomic, copy) void (^backblock)(id sender);



@end

NS_ASSUME_NONNULL_END
