//
//  KNdrawView.h
//  drawView
//
//  Created by mac on 2020/11/3.
//  Copyright © 2020 kunnan.blog.csdn.net   . All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KNdrawView : UIView

//线条的颜色透明度(颜色深浅),粗细，颜色
@property(nonatomic,strong) UIColor * lineColor;
@property(nonatomic,strong) NSNumber * lineWidth;
@property(nonatomic,assign) float lineArf;


//清除所有
-(void)cleanAll;
//上一步
-(void)backStep;
//下一步
-(void)nextStep;


@end

NS_ASSUME_NONNULL_END
