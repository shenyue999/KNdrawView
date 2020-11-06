//

#import <UIKit/UIKit.h>
#import <QMUIKit/QMUIButton.h>

NS_ASSUME_NONNULL_BEGIN
/**
 
 
 */
@interface CRMsignBottomView : UIView
//

@property(nonatomic, strong) QMUIButton *View_merchant_agreementBtn;


@property(nonatomic, strong) QMUIButton *signDoneBtn;

@property(nonatomic, strong) QMUIButton *clearBtn;

@property (nonatomic, copy) void (^signDoneActionblock)(id sender);
@property (nonatomic, copy) void (^clearSignActionBlock)(id sender);

///
@property (nonatomic, copy) void (^User_Agreement_and_Privacy_PolicySubjectBlock)(id sender);





@end

NS_ASSUME_NONNULL_END
