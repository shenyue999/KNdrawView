//

#import "HWNavigationController.h"
#import "GYQBaseBarItem.h"

#import "UIImage+Extension.h"

//.h
@implementation HWNavigationController
    
    

#pragma mark - 设置导航栏主题


+ (void) setttingAppearance{
    //设置全局导航条外观
    [self settingUINavigationBarAppearance];
    if (IOS7) {
        
//        if (@available(iOS 13.0, *)) {

        return;//不需要设置全局导航条按钮主题
    }
    //设置全局导航条按钮主题
    [self settingbarButtonItenAppearance];
}

+ (void) settingUINavigationBarAppearance{
    /*
     @protocol UIAppearance <NSObject>  协议的代理方法+ (instancetype)appearance;
     
     @interface UIView : UIResponder < UIAppearance>
     */
    //方式一：获取全局外观
    //    UINavigationBar *navigationBar =[UINavigationBar appearance];//获取所有导航条外观
    //方式二：获取我们自己导航控制器的导航条－－ 确保系统的其它功能（短信）的导航条与自己的冲突，尤其在短信分享这方面要注意
    UINavigationBar *navigationBar;
    if (IOS9) {
        //9.0的API
        navigationBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[HWNavigationController class]]];
    }else{
        navigationBar = [UINavigationBar appearanceWhenContainedIn:[HWNavigationController class],nil];
    }
    
    /**
     导航栏背景的出图规格
     iOS6导航栏背景的出图规格
     非retina：320x44 px
     retina：640x88 px
     iOS7导航栏背景的出图规格
     retina：640x128 px
     */
    
    
    
    [self setupUINavigationBarsetBackgroundImage:navigationBar];
    /*2.
     ＊标题：@property(nonatomic,copy) NSDictionary *titleTextAttributes;// 字典中能用到的key在UIStringDrawing.h中// 最新版本的key在UIKit框架的NSAttributedString.h中
     
     */
    //    NSDictionary *dict = @{UITextAttributeTextColor:[UIColor whiteColor]};
    NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:kNavListNSFontAttributeName};
    [navigationBar setTitleTextAttributes:dict];
    //2、The tint color to apply to the navigation items and bar button items. 导航条的主题颜色
    [navigationBar setTintColor:[UIColor whiteColor]];
    
    
}
#pragma mark - ******** 设置导航条渐变颜色
+ (void)setupUINavigationBarsetBackgroundImage:(UINavigationBar*)navigationBar{
    
    UIImage *bgImg = [UIImage getMaingradientColorImage];
    [navigationBar setBackgroundImage:bgImg forBarMetrics:UIBarMetricsDefault];

    
}





+ (void) settingbarButtonItenAppearance{
    /**
     NS_CLASS_AVAILABLE_IOS(2_0) @interface UIBarItem : NSObject <NSCoding, UIAppearance>
     */
    //导航栏按钮主题
    UIBarButtonItem *barButtonIten = [UIBarButtonItem appearance];
    /*
     设置主题的方法：
     背景：- (void)setBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics;
     文字：- (void)setTitleTextAttributes:(NSDictionary *)attributes forState:(UIControlState)state;
     导航栏返回按钮背景：- (void)setBackButtonBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics;
     */
    [barButtonIten setTintColor:[UIColor whiteColor]];
    
    
    
    
    [barButtonIten setBackButtonBackgroundImage:[UIImage imageNamed:QCTNAVicon_left] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [barButtonIten setBackButtonBackgroundImage:[UIImage imageNamed:QCTNAVicon_left] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
}



#pragma mark - 设置一次性属性
/**
 1、ninitailize、load方法的区别：
 initailize、load都是类方法
 当一个类被装载进内存时，就会调用一次load方法（当时这个类还不可用）
 当第一次使用这个类,或者这个类的子类的时候，就会调用一次initailize方法
 2.+ (void)initialize
 Initializes the class before it receives its first message.
 */


+ (void)initialize{
    
    if (self == [HWNavigationController class]) {//保证只调用一次
        // ... do the initialization ...
        //设置导航条主题
        [self setttingAppearance];
        
        
        UIBarButtonItem *barButtonItem=[UIBarButtonItem appearance];
        NSMutableDictionary *textAttributes= [NSMutableDictionary dictionary];
        textAttributes[NSForegroundColorAttributeName]= [UIColor whiteColor];
        textAttributes[NSFontAttributeName] = [UIFont systemFontOfSize:17];
        [barButtonItem setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
        //设置不可编辑状态的样式
        NSMutableDictionary *disabledTextAttributes= [NSMutableDictionary dictionary];
        disabledTextAttributes[NSForegroundColorAttributeName]= [UIColor grayColor];
        disabledTextAttributes[NSFontAttributeName] =  textAttributes[NSFontAttributeName];
        [barButtonItem setTitleTextAttributes:disabledTextAttributes forState:UIControlStateDisabled];
        
    }
    
  
   
}

- (void) setupinit{
    [HWNavigationController setupUINavigationBarsetBackgroundImage:self.navigationBar];
    
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    self.navigationBar.translucent = NO;
    
    ///** 控制多个控制器切换的时候，导航条在执行显示和隐藏的动画时候展示的颜色push*/
    self.view.backgroundColor =[UIColor whiteColor];

//    self.view.backgroundColor = BASE_RED_COLOR;// 防止当我们从Apush到B的时候如果window的背景颜色是黑色,这时候导航栏就会出现一个黑色的背景,用户体验就会特别差,


    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gotoTabWithindex:) name:WLGotoHWTabBarControllerTabBarIndexNotificationKey object:nil];


}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    
}

-(void)gotoTabWithindex:(NSNotification*)index
{
    NSNumber *number =(NSNumber*)index.object;
    NSLog(@"gotoTabWithindex:%@",index);
    
    [self popToRootViewControllerAnimated:nil];
    [self dismissViewControllerAnimated:nil completion:nil];
    //    self.selectedIndex= number.intValue;
}


    
    - (instancetype)init {
        self = [super init];
        if (self) {////既然nil解析成NO，所以没有必要在条件语句比较。不要拿某样东西直接与YES比较，因为YES被定义为1
            // ...
            // 修改颜色为绿色  0,207,13  HWColor(255, 64, 64)
            
            [self setupinit];

        }
        return self;
    }

    
    - (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
        self = [super initWithRootViewController:rootViewController];
        if (self) {////既然nil解析成NO，所以没有必要在条件语句比较。不要拿某样东西直接与YES比较，因为YES被定义为1
            // ...
            
            [self setupinit];


            
        }
        return self;
        
        
    }
    
    

#pragma mark - 拦截push;--//90%的拦截，都是通过自定义类，重写自带的方法实现
/**
 自定义导航控制器的价值：
 重写push方法就可以拦截所有压入栈中的子控制器，统一做一些处理

 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    viewController.hidesBottomBarWhenPushed = self.viewControllers.count == 1;

    
    if (self.viewControllers.count>0) {
        
        [self setNavigationBarHidden:NO animated:NO];
//        viewController.hidesBottomBarWhenPushed =YES;
        

        
        if ([viewController respondsToSelector:@selector(KNbackAction)]) {
            
            UIBarButtonItem *tmp =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:QCTNAVicon_left] style:0 target:viewController action:@selector(KNbackAction)];

            viewController.navigationItem.leftBarButtonItem = tmp;

        }else{
            
            UIBarButtonItem *tmp =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:QCTNAVicon_left] style:0 target:self action:@selector(backAction)];
            viewController.navigationItem.leftBarButtonItem = tmp;

        }
        
    }
    [super pushViewController:viewController animated:animated];

}


#pragma mark - 重写: animated:
/**
 1）自定义导航控制器的价值
 重写push方法就可以拦截所有压入栈中的子控制器，统一做一些处理
 */
    
- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    
    
    

        self.modalPresentationStyle = UIModalPresentationFullScreen;

    
        if ( [viewControllerToPresent  isKindOfClass:[UINavigationController class]]) {
            
            
            
            
            

            
            
            UINavigationController  *viewControllerToPresenttmp = (UINavigationController*)viewControllerToPresent;
            
//            weakSelf(weakSelf);
            
            __weak __typeof__(self) weakSelf = self;


            if ([[viewControllerToPresenttmp topViewController] respondsToSelector:@selector(KNprebackAction)]) {
                
                GYQBaseBarItem *tmp =[[GYQBaseBarItem alloc]initWithImage:[UIImage imageNamed:QCTNAVicon_left] style:0 target:[viewControllerToPresenttmp topViewController] action:@selector(KNprebackAction)];
                tmp.baseVC = viewControllerToPresent;
                viewControllerToPresenttmp.topViewController.navigationItem.leftBarButtonItem = tmp;

                
                
            }else{
                
                GYQBaseBarItem *tmp =[[GYQBaseBarItem alloc]initWithImage:[UIImage imageNamed:QCTNAVicon_left] style:0 target:weakSelf action:@selector(presenbackAction:)];
                tmp.baseVC = viewControllerToPresent;
                viewControllerToPresenttmp.topViewController.navigationItem.leftBarButtonItem = tmp;

            }

            
        }

        
        
    
    [super presentViewController:viewControllerToPresent animated:flag completion:completion];
}
    
-(void)presenbackAction:(GYQBaseBarItem *)bar{
    
    //一旦点击返回，就要打断首次流程
    [bar.baseVC dismissViewControllerAnimated:YES completion:nil];
}
    
- (void)backAction{
    
    [self popViewControllerAnimated:YES];

    
    
    
}

- (void)moreAction{
    [self popToRootViewControllerAnimated:YES];
}


- (void)viewDidLoad{
    [super viewDidLoad];
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];


}


+ (void)setupDetailnavigationItemAndBarStyle:(UIViewController*)vc{
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    

    
    [vc.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName :kNavListNSFontAttributeName }];
    vc.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];

    
    [HWNavigationController setupUINavigationBarsetBackgroundImage:vc.navigationController.navigationBar];

    
    
}


#pragma mark - ******** 设置列表控制器的样式
+ (void)setupListnavigationItemAndBarStyle:(UIViewController*)vc{
    //   修改返回箭头样式
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    [vc.navigationController.navigationBar setTintColor: kNavListbackArrowColor];
    [vc.navigationController.navigationBar setBackgroundImage:[ImageTools createImageWithColor: [UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    // 设置标题颜色
    NSDictionary *dict = @{NSForegroundColorAttributeName: kNavListTextColor,NSFontAttributeName:kNavListNSFontAttributeName};
    [vc.navigationController.navigationBar setTitleTextAttributes:dict];
    
    
    NSDictionary *dictitem = @{NSForegroundColorAttributeName: kNavListbackArrowColor,NSFontAttributeName:kNavListUIBarButtonItemNSFontAttributeName};

    
    for (UIBarButtonItem* item  in vc.navigationItem.leftBarButtonItems) {
            [item setTitleTextAttributes:dictitem forState:UIControlStateNormal];

        
//        [item setTitleTextAttributes:dict];
    }
//    [vc.navigationItem.leftBarButtonItems setTitleTextAttributes:dict];

    //    2、The tint color to apply to the navigation items and bar button items. 导航条的主题颜色
}


#pragma mark - ******** 修改状态栏的样式
/**
 //1、View controller-based status bar appearance的默认值就是YES。则[UIApplication sharedApplication].statusBarStyle 无效。
 //此时需要在viewDidload中调用：[self setNeedsStatusBarAppearanceUpdate];，但是但是，当vc在nav中时，上面方法没用，vc中的preferredStatusBarStyle方法根本不用被调用。
 //原因是，[self setNeedsStatusBarAppearanceUpdate]发出后，
 //    只会调用navigation controller中的preferredStatusBarStyle方法，
 
 //2、 解决办法：设置navbar的barStyle 属性会影响status bar 的字体和背景色。如下。
 ////导航栏的背景色是黑色。
 //        self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
 */
- (void)setupNavigationBarBarStyle:(NSInteger)barStyle{
    
    
    switch (barStyle) {
        case UIBarStyleDefault:
        {
            
            self.navigationBar.barStyle = barStyle;
            
        }
            break;
            
        case UIBarStyleBlack://1
        {
            self.navigationBar.barStyle = barStyle;
            
        }
            break;
            
            
            
        default:
            break;
    }
}

- (BOOL)shouldAutorotate{
    return [self.visibleViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return [self.visibleViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [self.visibleViewController preferredInterfaceOrientationForPresentation];
}




@end
