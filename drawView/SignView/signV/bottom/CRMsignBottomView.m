//
//  CRMsignBottomView.m
//  Housekeeper
//
//  Created by mac on 2020/3/11.
//  Copyright © 2020 QCT. All rights reserved.
//

#import "CRMsignBottomView.h"

@implementation CRMsignBottomView
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.signDoneBtn layoutIfNeeded];

    self.signDoneBtn.layer.cornerRadius = 4;
    
    
    [self.clearBtn layoutIfNeeded];
    self.clearBtn.layer.cornerRadius = 4;
    self.clearBtn.layer.borderColor = [[UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1.0f] CGColor];
    self.clearBtn.layer.borderWidth = 1;

    
    //
    
    [self.View_merchant_agreementBtn layoutIfNeeded];
    self.View_merchant_agreementBtn.layer.cornerRadius = 4;
    self.View_merchant_agreementBtn.layer.borderColor = [[UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1.0f] CGColor];
    self.View_merchant_agreementBtn.layer.borderWidth = 1;


    

}



- (instancetype)init
{
    self = [super init];
    if (self) {
        [self signDoneBtn];
        [self clearBtn];
        [self View_merchant_agreementBtn];
        
        
//        self.qmui_borderWidth
//        kn_top
        
        UIView *bottomBorder = [UIView new];
        
        //        bottomBorder.frame = CGRectMake(0.0f, (self.bounds.size.height - 1), self.bounds.size.width, 1);
        
        bottomBorder.backgroundColor = rgb(204,204,204);//没有贴到view上
        [self addSubview:bottomBorder];
        
        [bottomBorder mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self);
            make.height.mas_equalTo(1);
            make.left.equalTo(self);
            make.top.equalTo(self);
            
        }];

        
    }
    return self;
}
- (QMUIButton *)signDoneBtn{
    if (nil == _signDoneBtn) {
        QMUIButton *tmpView = [[QMUIButton alloc]init];
        _signDoneBtn = tmpView;
//
        
            
            tmpView.titleLabel.font = kPingFangFont(15);

                [tmpView setTitle:@"确认签名" forState:UIControlStateNormal];
                [tmpView setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];

                
                tmpView.backgroundColor =  rgb(255,54,87);
                
                
        __weak __typeof__(self) weakSelf = self;
        [self addSubview:tmpView];

                [tmpView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.equalTo(weakSelf).offset(kAdjustRatio(-15));
                    make.centerY.equalTo(weakSelf.clearBtn);
                }];
            [tmpView.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.right.offset(kAdjustRatio(-25));
                make.left.offset(kAdjustRatio(25));
                make.top.offset(kAdjustRatio(15));
                make.bottom.offset(kAdjustRatio(-15));

                

            }];
            

        //signDoneActionblock
        [[tmpView rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
            
            if(weakSelf.signDoneActionblock){
                weakSelf.signDoneActionblock(nil);
            }
            
        }];
        tmpView.layer.masksToBounds = YES;

        
        
        
        
        
    }
    return _signDoneBtn;
}

- (QMUIButton *)clearBtn{
    if (nil == _clearBtn) {
        QMUIButton *tmpView = [[QMUIButton alloc]init];
        _clearBtn = tmpView;
//        [self.contentView addSubview:_clearBtn];
        

            tmpView.layer.masksToBounds = YES;
            NSString *title = @"清除重写";
            [tmpView setTitle:title forState:UIControlStateNormal];
            [tmpView setTitleColor:[UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1.0f] forState:UIControlStateNormal];
        
        
        
        tmpView.titleLabel.font = kPingFangFont(15);


        
        
        __weak __typeof__(self) weakSelf = self;
        [self addSubview:_clearBtn];
                    [_clearBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.left.equalTo(weakSelf).offset(kAdjustRatio(15));
                                make.top.equalTo(weakSelf).offset(kAdjustRatio(15));
                        
                        make.bottom.equalTo(weakSelf).offset(kAdjustRatio(-12));
                        

                    }];
                [_clearBtn.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.offset(kAdjustRatio(-25));
                    make.left.offset(kAdjustRatio(25));
                    make.top.offset(kAdjustRatio(15));
                    make.bottom.offset(kAdjustRatio(-15));

            //        make.centerY.equalTo(weakSelf.clearBtn);
                }];
        

        [[tmpView rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
            
            if(weakSelf.clearSignActionBlock){
                weakSelf.clearSignActionBlock(nil);
            }
            
        }];

        

        
    }
    return _clearBtn;
}



- (QMUIButton *)View_merchant_agreementBtn{
    if (nil == _View_merchant_agreementBtn) {
        QMUIButton *tmpView = [[QMUIButton alloc]init];
        _View_merchant_agreementBtn = tmpView;
//
        
            
            tmpView.titleLabel.font = kPingFangFont(15);

                [tmpView setTitle:@"查看商户协议" forState:UIControlStateNormal];
                [tmpView setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];

        [tmpView setTitleColor:[UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1.0f] forState:UIControlStateNormal];

                
//                tmpView.backgroundColor =  rgb(255,54,87);

        
        
//        [self.contentView addSubview:_signDoneBtn];
        __weak __typeof__(self) weakSelf = self;
        [self addSubview:tmpView];

                [tmpView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.equalTo(weakSelf.signDoneBtn.mas_left).offset(kAdjustRatio(-10));
                    
                    
                    
                    make.centerY.equalTo(weakSelf.clearBtn);
                    
                    
                }];
            [tmpView.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.right.offset(kAdjustRatio(-25));
                make.left.offset(kAdjustRatio(25));
                make.top.offset(kAdjustRatio(15));
                make.bottom.offset(kAdjustRatio(-15));


            }];
            

        //signDoneActionblock
        [[tmpView rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
            
            if(weakSelf.User_Agreement_and_Privacy_PolicySubjectBlock){
                weakSelf.User_Agreement_and_Privacy_PolicySubjectBlock(nil);
            }
            
        }];
        tmpView.layer.masksToBounds = YES;

        
        
        
        
        
    }
    return _View_merchant_agreementBtn;
}
@end
