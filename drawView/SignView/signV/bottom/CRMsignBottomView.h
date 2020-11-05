//
//  CRMsignBottomView.h
//  Housekeeper
//
//  Created by mac on 2020/3/11.
//  Copyright © 2020 QCT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QMUIKit/QMUIButton.h>

NS_ASSUME_NONNULL_BEGIN

@interface CRMsignBottomView : UIView
//

@property(nonatomic, strong) QMUIButton *View_merchant_agreementBtn;


@property(nonatomic, strong) QMUIButton *signDoneBtn;

@property(nonatomic, strong) QMUIButton *clearBtn;

@property (nonatomic, copy) void (^signDoneActionblock)(id sender);
@property (nonatomic, copy) void (^clearSignActionBlock)(id sender);

///
@property (nonatomic, copy) void (^User_Agreement_and_Privacy_PolicySubjectBlock)(id sender);


//@property(nonatomic, strong)  CRMsignBottomView *signBottomView;



@end

NS_ASSUME_NONNULL_END
