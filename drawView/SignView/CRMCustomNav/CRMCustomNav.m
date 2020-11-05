//
//  CRMCustomNav.m
//  Housekeeper
//
//  Created by mac on 2020/3/16.
//  Copyright © 2020 QCT. All rights reserved.
//

#import "CRMCustomNav.h"
//导航栏高度
//#define HitoNavHeight 44

@implementation CRMCustomNav
//
//@property (nonatomic,weak) UILabel *titleLab;
//
//@property (nonatomic,weak) UIButton *titleBtn;


- (instancetype)init
{
    self = [super init];
    if (self) {
                [self titleLab];
        [self titleBtn];
        

    }
    return self;
}


- (UIButton *)titleBtn{
    if (nil == _titleBtn) {
        UIButton *tmpView = [[UIButton alloc]init];
        _titleBtn = tmpView;
        [self addSubview:_titleBtn];
        
        
        __weak __typeof__(self) weakSelf = self;
//        make.height.mas_equalTo(HitoNavHeight+kAdjustRatio(10));

        [_titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.centerX.offset(0);
            
            
            
            make.bottom.offset(kAdjustRatio(-20));//0.8
            
            
            
            
            
            make.size.mas_equalTo(CGSizeMake(kAdjustRatio(HitoNavHeight), HitoNavHeight));
            
            //
            
//            make.top.mas_equalTo(kAdjustRatio(10));
            
            

        }];
        
        [[_titleBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            if(weakSelf.backblock){
                weakSelf.backblock(nil);
            }
        }];
        
        

        
        [_titleBtn setImage:[UIImage imageNamed:@"icon_leftarrow"] forState:UIControlStateNormal];
        
//        [[GYQBaseBarItem alloc]initWithImage: style:0 target:weakSelf action:@selector(presenbackAction:)];

        
    }
    return _titleBtn;
}


- (UILabel *)titleLab{
    if (nil == _titleLab) {
        UILabel *tmpView = [[UILabel alloc]init];
        _titleLab = tmpView;
        [self addSubview:_titleLab];
        
        
        __weak __typeof__(self) weakSelf = self;

        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
           
            

            
            make.center.offset(0);
            
            
            
            

        }];
        _titleLab.numberOfLines = 0;
//        _titleLab. = NSTextAlignmentCenter;
//        iOS - Label文字竖排
//_titleLab.text.

//@第六梦 刚刚查询了，是verticalForm，设为YES就可以了
//回复

//        _titleLab.textAlignment = NSTextAlignmentCenter;
        //@TheOlivine 谢谢，我们已经找到里解决方法YYtext可以设置竖排文字
//        回复

        _titleLab.text = @"采\n集\n签\n名";
        
        //@seasa kCTVerticalFormsAttributeName
//        回复
        

        [_titleLab setTextColor: kNavListTextColor];
        
        [_titleLab setFont: kNavListNSFontAttributeName];


        
        
    }
    return _titleLab;
}


@end
