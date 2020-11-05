//
//  KNsignV.h
//  drawView
//
//  Created by mac on 2020/11/5.
//  Copyright © 2020 https://kunnan.blog.csdn.net        . All rights reserved.
//
#import "KNSignatureViewModel.h"
#import "CRMplaceHoalderLabel.h"
#import "CRMsignBottomView.h"

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KNsignV : UIView

@property (strong, nonatomic) KNSignatureViewModel *viewModel;

/**
 已签名的照片,跳转传入
 */
@property(nonatomic, strong) UIImage *signImage;

/**
 签名笔划颜色，默认blackColor
 */
@property(nonatomic, strong) UIColor *lineColor;

/**
 签名笔划宽度，默认3.3
 */
@property(nonatomic, assign) CGFloat lineWidth;

/**
 无签名时占位文字，默认"签名区域"
 */
@property(nonatomic, copy) NSString *placeHoalder;

/**
 占位文字字体颜色，默认grayColor
 */
@property(nonatomic, strong) UIColor *placeHoalderTextColor;

/**
 占位文字字体大小，默认35
 */
@property(nonatomic, strong) UIFont *placeHoalderTextFont;

/**
 签名完成的回调Block,签名图片
 */
@property(nonatomic, copy) void(^signDone)(UIImage *signImage);

/**
 清除Blcok,可调用- (void)clearSignature;进行清除已有签名
 */
@property(nonatomic, copy) void(^signClear)(KNsignV *signView);





//@property(nonatomic, copy) void(^signClear)(id x);
//@property (nonatomic, copy) void (^block)(id sender);
@property (nonatomic, copy) void (^User_Agreement_and_Privacy_PolicySubjectBlock)(id sender);




/**
 清除签名
 */
- (void)clearSignature;



// *

- (instancetype)initWithFrame:(CGRect)frame ViewModel:(id)viewModel ;
//
- (instancetype)initWithViewModel:(id)ViewModel ;
//@property (strong, nonatomic) CRM_LandscapeRightSignatureViewModel *viewModel;

@property(nonatomic, strong) UIImageView *signImageView;



@property(nonatomic, strong) CRMplaceHoalderLabel *placeHoalderLabel;




@property(nonatomic, assign) CGPoint lastPoint;
@property(nonatomic, assign) BOOL isSwiping;
@property(nonatomic, strong) NSMutableArray *pointXs;
@property(nonatomic, strong) NSMutableArray *pointYs;

//
@property(nonatomic, strong)  CRMsignBottomView *signBottomView;



@property(nonatomic, strong) UIButton *signDoneBtn;

@property(nonatomic, strong) UIButton *clearBtn;






@end

NS_ASSUME_NONNULL_END
