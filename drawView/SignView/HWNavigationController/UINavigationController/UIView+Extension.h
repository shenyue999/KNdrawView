//
//  UIView+Extension.h
//  HWeibo
//
//  Created by devzkn on 6/27/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *viewTapHandlerKey;

typedef void(^UIViewTapHandler)(UIView *view);


@interface UIView (Extension)
@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat y;
@property (nonatomic,assign) CGFloat centerX;
@property (nonatomic,assign) CGFloat centerY;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign) CGSize size;
@property (nonatomic,assign) CGPoint origin;


- (UIView*)subViewOfClassName:(NSString*)className ;


- (UIViewController *)viewControllerResponder;

- (void)setBorderColor:(UIColor *)color width:(CGFloat)width;
- (void)setShadowColor:(UIColor *)color opacity:(CGFloat)opacity offset:(CGSize)offset blurRadius:(CGFloat)blurRadius;

- (void)setCornerOnTop:(CGFloat)radius;
- (void)setCornerOnBottom:(CGFloat)radius;
- (void)setCornerOnLeft:(CGFloat)radius;
- (void)setCornerOnRight:(CGFloat)radius;
- (void)setCornerOnTopLeft:(CGFloat)radius;
- (void)setCornerOnTopRight:(CGFloat)radius;
- (void)setCornerOnBottomLeft:(CGFloat)radius;
- (void)setCornerOnBottomRight:(CGFloat)radius;
- (void)setAllCorner:(CGFloat)radius;
- (void)setCornerRadius:(CGFloat)radius;

- (UIImage *)snapshotView;

- (void)removeAllSubviews;

- (void)tapAction:(UIViewTapHandler)handler;

/**
 *  设置部分圆角, 相对布局.
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 CGSizeMake(20.0f, 20.0f)
 *  @param rect    需要设置的圆角视图大小
 */
- (void)addRoundedCorners:(UIRectCorner)corners withRadii:(CGSize)radii viewRect:(CGRect)rect;
- (void)addRoundedCorners:(UIRectCorner)corners withRadii:(CGSize)radii;

/**
 绘制虚线条
 
 @param startPoint 起点
 @param endPoint   终点
 @param lineColor  线条颜色
 @param lineHeight 线条高度
 @param view       绘制的目标视图
 */
- (void)drawImaginaryLineWithStartPoint:(CGPoint)startPoint
                               endPoint:(CGPoint)endPoint
                              lineColor:(UIColor *)lineColor
                             lineHeight:(CGFloat)lineHeight
                                 onView:(UIView *)view;


@end
