//
//  KNSignViewController.m
//  drawView
//
//  Created by mac on 2020/11/5.
//  Copyright © 2020 https://kunnan.blog.csdn.net        . All rights reserved.
//https://blog.csdn.net/z929118967/article/details/104796781




#import "KNSignViewController.h"

@interface KNSignViewController ()

@end

@implementation KNSignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"采集签名";
    self.view.backgroundColor = [UIColor whiteColor];

    
    
    // Do any additional setup after loading the view.
}

- (KNSignatureViewModel *)viewModel{
    
    if (_viewModel == nil) {
        _viewModel = [KNSignatureViewModel new];

    }
    return _viewModel;
    
}




- (CRMCustomNav *)CustomNav{
    if (nil == _CustomNav) {
        CRMCustomNav *tmpView = [[CRMCustomNav alloc]init];
        _CustomNav = tmpView;
        [self.view addSubview:_CustomNav];
        
        
        __weak __typeof__(self) weakSelf = self;

        [_CustomNav mas_makeConstraints:^(MASConstraintMaker *make) {
            
            
                                        make.top.equalTo(weakSelf.view).offset(kAdjustRatio(0));
            //
            //            }

                        
                        make.left.offset(HitoStatusHeight);
            
            
            

            
                make.width.mas_equalTo(HitoNavHeight);
                
            make.bottom.equalTo(weakSelf.view).offset(kAdjustRatio(0));

            

            
        }];
        
        
        [_CustomNav setBackblock:^(id  _Nonnull sender) {
//            [weakSelf.navigationController popViewControllerAnimated:YES];
            [self KNbackAction];
        }];
        
    }
    return _CustomNav;
}


- (KNsignV    *)signV{
    if (!_signV) {
        
        KNsignV *sign = [[KNsignV   alloc] initWithViewModel:self.viewModel];
        
        
        _signV= sign;
        
        __weak __typeof__(self) weakSelf = self;
        
        [self.view addSubview:_signV];
        
        

        [_signV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            

            
            make.left.equalTo(weakSelf.CustomNav.mas_right).offset(kAdjustRatio(0));
            

            make.right.equalTo(weakSelf.view).offset(kAdjustRatio(-5));
            make.top.equalTo(weakSelf.view).offset(kAdjustRatio(5));
            make.bottom.mas_equalTo(weakSelf.view).offset(-5);


            
        }];

        sign.lineColor = [UIColor blueColor];
#pragma mark - ******** 电子签名事件处理：保存请求signDone、signClear、ViewPolicy

        sign.signDone = ^(UIImage *signImage) {
            
            weakSelf.signResult(signImage);
            
//            [weakSelf.navigationController popViewControllerAnimated:YES];
        };
        
        
        sign.signClear = ^(KNsignV *signView) {
            [signView clearSignature];
            
        };
        

        
        
        
        [sign setUser_Agreement_and_Privacy_PolicySubjectBlock:^(id  _Nonnull sender) {
            [weakSelf setupUser_Agreement_and_Privacy_PolicySubject];
            
        }];
        
        
        
    }
    return _signV;
}






/**
 处理查看商户协议  废弃
 
 */
- (void)setupUser_Agreement_and_Privacy_PolicySubject{
    

}

#pragma mark - 如果是psesent,下面代码就可以实现横屏
/**
 只有在当前viewController是window的rootViewController。或者是通过presentModalViewController而显示出来的.才会生效。作用于viewController及其childViewController
 */
- (BOOL)shouldAutorotate {
    return YES;//YES

}
//• supportedInterfaceOrientations是在该viewController中支持的所有方向；
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscapeRight;
}
/**
 流程说明

 首先，对于任意一个viewController，iOS会以info.plist中的设置和当前viewController的preferredInterfaceOrientationForPresentation和supportedInterfaceOrientations三者支持的方法做一个交运算，若交集不为空，则以preferredInterfaceOrientationForPresentation为初始方向，交集中的所有方向均支持，但仅在shouldAutorotate返回YES时，允许从初始方向旋转至其他方向。若交集为空，进入viewController时即crash，错误信息中会提示交集为空。

 
 ————————————————
 其次，如果要在横竖屏间切换，建议使用presentXXX方法。UINavigationController稍有些特别，难以用常规API做到同一个naviVC中的ViewController在不同方向间自如地切换。(不太建议使用hacky trick：present empty viewController and then dismiss it)，

 
 ————————————————
 */
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationLandscapeRight;
}
/**
 在执行 didFinishLaunchingWithOptions: 这个代理方法时，在执行[self.window makeKeyAndVisible];方法之前，通过[UIApplication sharedApplication].keyWindow 方法获取不到window，
 
 但是无论何时都能获取到delegate.window。
 1、在获取到window时最好使用[[UIApplication sharedApplication].delegate window]获取window
 2、不要在keywindow为nil的时候给window上添加代码，例如添加弹窗。
keyWindow是会变的
 
 
 

 解决问题：首次跳转到采集签名页面，有一半，屏幕是暗的，点击屏幕后才正常. 且这样的情况下查看商户协议和确认签名按钮无法点击.

 重现方法：从商户列表去新增进件的商户
 原因：商户列表的筛选视图添加到keyWindow的顶部视图，居于顶部。而且视图隐藏的方式是采用的一种不推荐的小技巧(将筛选视图的x(视图的左侧)设置为竖屏状态下的屏幕宽度1.15倍。这样搜索视图就移动到屏幕右侧，在竖屏就看不见，而在电子签名切换到横屏的时候，就展现了)

 另外：之前我这边无法重现是因为，我一直都是直接从工作台的商户进件入口去签名的。其他控制器没有这个问题，是因为其他视图不是横屏，所以也无法重现。

 目前的解决方案：
 1、电子签名视图即将展示的 时候，保证先设置View约束，再进行切换横屏。
 2、切换横屏之后再设置电子签名界面始终在最前面
 self.view.layer.zPosition = 999// 解决事件被拦截问题：且这样的情况下查看商户协议和确认签名按钮无法点击.
 


 */
- (void)createView{
    
//    if(_signV != nil){
//        return;
//    }
    [self signV];// 先执行自动约束，在切换横屏
//    self.view.layer.zPosition = 999;
// 创建顶部的返回按钮：因为iPhonex 导航条高度变小 无法返回
    
    [self CustomNav];
    

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"touches:%@",event);
    NSLog(@"event:%@",event);

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
        self.navigationController.navigationBarHidden = YES;
        
        
//        [HWNavigationController setupListnavigationItemAndBarStyle:self];
    

    [self createView];
    
    [QCT_Common setupUIInterfaceOrientationLandscapeRight];
    
    
    
    

}


- (void)KNbackAction{//失效 被拦截了
    
    [self.navigationController popViewControllerAnimated:YES];
    
    if ( self.backblock) {
        self.backblock(nil);
    }
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    self.navigationController.navigationBarHidden = NO;
    
        [QCT_Common setupUIInterfaceOrientationMaskPortrait];

}



/**
 iPhoneX横竖屏旋转适配


 */
- (void)viewDidLayoutSubviews{

    [super viewDidLayoutSubviews];
    
    
    [self.signV layoutIfNeeded];
    
    self.signV.layer.borderColor = [[UIColor colorWithRed:204.0f/255.0f green:204.0f/255.0f blue:204.0f/255.0f alpha:1.0f] CGColor];
    self.signV.layer.borderWidth = 1;
    self.signV.alpha = 1;


    
}


//-(void)setNeedsStatusBarAppearanceUpdate {
//    NSLog(@"---self setNeedsStatusBarAppearanceUpdate---");
//}

-(BOOL)prefersStatusBarHidden {
    return NO;
}

//状态栏样式
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

//————————————————
//版权声明：本文为CSDN博主「Solar_Terry」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
//原文链接：https://blog.csdn.net/Solar_Terry/article/details/78221072



- (void)durationUIInterfaceOrientationLandscapeRight {
//    [super viewWillAppear:animated];
    // 旋转角度 0.5➡️横屏 1.5⬅️横屏 2⬆️竖屏 1⬇️竖屏
    CGFloat duration = [UIApplication sharedApplication].statusBarOrientationAnimationDuration;//时间
    [UIView animateWithDuration:duration animations:^{
        self.navigationController.view.transform = CGAffineTransformMakeRotation(M_PI*0.5);
        self.navigationController.view.bounds = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width);
    }];
//    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    
    
}
- (void)durationUIInterfaceOrientationUIDeviceOrientationPortrait {
//    [super viewWillDisappear:animated];
    //视图将要消失的时候 再把视图翻转回来 ，不会影响其他VC的展示
    CGFloat duration = [UIApplication sharedApplication].statusBarOrientationAnimationDuration;
    [UIView animateWithDuration:duration animations:^{
        self.navigationController.view.transform = CGAffineTransformMakeRotation(M_PI*2);
        self.navigationController.view.bounds = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    }];
}




@end
