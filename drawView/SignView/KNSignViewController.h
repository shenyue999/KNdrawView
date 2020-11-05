//
//  KNSignViewController.h
//  drawView
//
//  Created by mac on 2020/11/5.
//  Copyright © 2020 https://kunnan.blog.csdn.net        . All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "CRMCustomNav.h"
#import "KNsignV.h"


#import "CRMCustomNav.h"




NS_ASSUME_NONNULL_BEGIN


@interface KNSignViewController : UIViewController


@property (nonatomic, strong) CRMCustomNav* CustomNav;//


// 用于协议，demo目前删除这个模块
//@property (nonatomic , strong) CRMSaveStoreeCertificateInfoDto *saveStoreeCertificateInfoDto;
//@property (nonatomic , strong) CRMStoreInfoViewDto *dto;


@property(nonatomic, copy) void(^signResult)(UIImage *signImage);

// *

@property (nonatomic, strong) KNsignV* signV;//




@property (strong, nonatomic) KNSignatureViewModel *viewModel;





@property (nonatomic, copy) void (^backblock)(id sender);




@end

NS_ASSUME_NONNULL_END
