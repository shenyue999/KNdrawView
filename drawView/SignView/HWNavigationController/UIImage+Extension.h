//
//  UIImage+Extension.h
//  read_gzh
//
//  Created by xuan on 2017/4/23.
//  Copyright © 2017年 duotin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GradientType) {
    GradientTypeTopToBottom = 0,//从上到小
    GradientTypeLeftToRight = 1,//从左到右
    GradientTypeUpleftToLowright = 2,//左上到右下
    GradientTypeUprightToLowleft = 3,//右上到左下
};

@interface UIImage (Extension)


+ (UIImage *) createImageWithColor: (UIColor *) color;


/**
 关于[UIBarButtonItem alloc] initWithImage:颜色被冲的解决办法
 
 @param imageNamed <#imageNamed description#>
 @return <#return value description#>
 */
+ (instancetype)getUIImageRenderingModeAlwaysOriginalWithImgName:(NSString*)imageNamed;

/**
 获取渐变的颜色UIImage
*/
+ (UIImage*)getMaingradientColorImage;


+ (UIImage*)getDetailOrderStateMaingradientColorImage;

    
    
/**
 主色调
 @return <#return value description#>
 */
+ (UIColor*)getMaingradientColor;
/**
 获取渐变的颜色
 
 @return 从左往右
 */
+ (UIColor*)getMaingradientColorWithstart_COLOR:(UIColor*)topleftColor  end_COLOR:(UIColor*)bottomrightColor;

///设置图片渐变色(左右)
+ (instancetype)gradientColorImageFromColors:(NSArray *)colors frame:(CGRect)frame;

///设置图片渐变色(四种样式)
+ (instancetype)gradientColorImageFromColors:(NSArray*)colors gradientType:(GradientType)gradientType imgSize:(CGSize)imgSize;

// 加载最原始的图片，没有渲染
+ (instancetype)imageWithOriginalName:(NSString *)imageName;

// 拉伸图片
+ (instancetype)imageWithStretchableName:(NSString *)imageName;
    
/**
 *
 *  @param bgImageName    背景图片
 *  @param waterImageName 水印图片
 *  @param scale 图片生成的比例
 *  @return 添加了水印的背景图片
 */
+(instancetype)waterImageWithBgImageName:(NSString *)bgImageName waterImageName:(NSString *)waterImageName scale:(CGFloat)scale;
    
/**
 *  返回一张截图
 */
+(instancetype)captureWithView:(UIView *)view;
    
/**
 *  返回一张自由拉伸的图片
 */
+ (instancetype)resizedImageWithName:(NSString *)name;
    
/**
 *  返回拉伸的图片
 */
+ (instancetype)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;

/**
 *  剪切图片为正方形
 *  @param image   原始图片比如size大小为(400x200)pixels
 *  @param newSize 正方形的size比如400pixels
 *  @return 返回正方形图片(400x400)pixels
 */
+ (instancetype)squareImageFromImage:(UIImage *)image scaledToSize:(CGFloat)newSize;
    
/**
 非正方形图片裁剪正方形[以中心裁剪]
 @param image 原始图片片比如size大小为(400x300)pixels
 @return 返回正方形图片(400x400)pixels
 */
+ (instancetype)squareImageFromImage:(UIImage *)image placeholderImageName:(NSString *)imageName;

/**
 *  通过 Quartz 2D 在 UIImageView 绘制虚线
 *  param imageView 传入要绘制成虚线的imageView
 *  return
 */
- (instancetype)drawLineOfDashByImageView:(UIImageView *)imageView;

+ (instancetype)sizeImageFromImage:(UIImage *)image scaledToSize:(CGSize)newSize;
    
+ (instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
    
+ (instancetype)circleImageWithImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
    
+ (instancetype)imageFromMainBundleWithName:(NSString *)name;
    
//通过URL获取图片大小
+ (CGSize)getImageSizeWithURL:(id)imageURL;
    
//获取PNG图片的大小
+ (CGSize)getPNGImageSizeWithRequest:(NSMutableURLRequest*)request;
    
//获取gif图片的大小
+ (CGSize)getGIFImageSizeWithRequest:(NSMutableURLRequest*)request;
    
//获取jpg图片的大小
+ (CGSize)getJPGImageSizeWithRequest:(NSMutableURLRequest*)request;

- (UIImage *)compressWithTargetPixel:(NSUInteger)targetPx ;
@end
