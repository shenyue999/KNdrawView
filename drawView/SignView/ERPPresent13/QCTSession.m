//
//  QCTSession.m
//  drawView
//
//  Created by mac on 2020/11/6.
//  Copyright © 2020 https://kunnan.blog.csdn.net        . All rights reserved.
//

#import "QCTSession.h"

@implementation QCTSession
HSSingletonM(QCTSession);

- (NSMutableArray *)OverCurrentContextClasss{
    
    if(_OverCurrentContextClasss == nil){
        
        _OverCurrentContextClasss = [NSMutableArray array];
        
        
        
        //.. 发布商品- 选择商品类目
        
        [_OverCurrentContextClasss addObject:@"ERPSelect_commodity_categoryViewController"];

        
    }
    return _OverCurrentContextClasss;
    
}

- (NSMutableArray *)FullScreenClasss{
    
    if(_FullScreenClasss == nil){
        
        _FullScreenClasss = [NSMutableArray array];
        
        
        [_FullScreenClasss addObject:@"PGDatePickManager"];
        
        
    }
    return _FullScreenClasss;
    
}


#pragma mark - ******** 根据定义的规则，返回Modal风格类型
+ (UIModalPresentationStyle)getModalPresentationStyleWith:(UIViewController*)viewControllerToPresent{
    
    
    
    
    
                            if([viewControllerToPresent isMemberOfClass:NSClassFromString(@"UISnapshotModalViewController") ]){
                                
                                
                                
                                return UIModalPresentationOverFullScreen;
                                
                                
                            }
    
    
    //
    
    
    if(
                                         [QCTSession.shareQCTSession.OverCurrentContextClasss containsObject:NSStringFromClass(viewControllerToPresent.class)])
                                    
                                
                                {
                                    

                                    

                                    return UIModalPresentationOverCurrentContext;


                            }
    
    
    

    
    if(
                                         [QCTSession.shareQCTSession.FullScreenClasss containsObject:NSStringFromClass(viewControllerToPresent.class)])
                                    
                                
                                {
                                    

                                    

                                    return UIModalPresentationFullScreen;


                            }
    
    
    
    
    
    
    if([viewControllerToPresent isMemberOfClass:NSClassFromString(@"HWNavigationController")] ){

        
                                    UINavigationController *nav = viewControllerToPresent;
                                    
                                    
                                    
                                    if( [QCTSession.shareQCTSession.FullScreenClasss4NavRootVC containsObject:NSStringFromClass(nav.visibleViewController.class)]){
                                        
                                        return UIModalPresentationFullScreen;
                                        
                                        
                                        
                                    }
                                    
                                    
                                   
                                    
                                    

                                    
                                    
                                }
    
    
                

    if (@available(iOS 13.0, *)) {
        return UIModalPresentationAutomatic;
    } else {
        // Fallback on earlier versions
        
        return UIModalPresentationFullScreen;

    }

    
    
    
}



#pragma mark - ******** 定义app中模态展示的视图全屏的VC
/**
 
 对于【present 半屏】的新特性，至少有两种场景不适用：

 -  列表界面需要支持下拉刷新
 - 模态展示之后，需要特殊处理用户点击返回箭头事件。（比如当编辑商品价格的时候，用户编辑一般放弃不保存，而是点击下滑/返回，这个时候需要还原数据信息）

 */
- (NSMutableArray *)FullScreenClasss4NavRootVC{
    
    if(_FullScreenClasss4NavRootVC == nil){
        
        _FullScreenClasss4NavRootVC = [NSMutableArray array];
        
        
        
        [_FullScreenClasss4NavRootVC addObject:@"QCTBluetoothListViewController"];
        

        [_FullScreenClasss4NavRootVC addObject:@"ERPMerchantUpdateEuipmentAliasViewController"];
        [_FullScreenClasss4NavRootVC addObject:@"QCTSetStoreName4PrinterViewController"];

        // 商品对规格信息界面
        [_FullScreenClasss4NavRootVC addObject:@"QCTeditskuInfoViewController"];

        

        
        
    }
    return _FullScreenClasss4NavRootVC;
    
}


@end
