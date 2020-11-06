//
//  UIImage+Extension.m
//  read_gzh
//
//  Created by xuan on 2017/4/23.
//  Copyright © 2017年 duotin. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)




+ (UIImage *) createImageWithColor: (UIColor *) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


//#define QCT_DetailOrder_start_COLOR rgb(236,90,85)
//#define QCT_DetailOrder_end_COLOR  rgb(214,50,44)
+ (UIImage*)getDetailOrderStateMaingradientColorImage{
    CGSize size = CGSizeMake(SCREENW, 83.0f);
    
    UIColor *topleftColor =  QCT_DetailOrder_start_COLOR;
    
    UIColor *bottomrightColor = QCT_DetailOrder_end_COLOR;
    
    UIImage *bgImg = [UIImage gradientColorImageFromColors:@[topleftColor, bottomrightColor] gradientType:GradientTypeLeftToRight imgSize:size];
    
    return bgImg;
}




+ (UIImage*)getMaingradientColorImage{
    
    
    CGSize size = CGSizeMake(SCREENW, 83.0f);
    
    UIColor *topleftColor =  BASE_start_COLOR;
    
    
    
    UIColor *bottomrightColor = BASE_end_COLOR;
    
    
    
    UIImage *bgImg = [UIImage gradientColorImageFromColors:@[topleftColor, bottomrightColor] gradientType:GradientTypeLeftToRight imgSize:size];
    
    return bgImg;
}


+ (UIColor*)getMaingradientColor{
    
    UIImage *bgImg = [UIImage getMaingradientColorImage];
    
    UIColor *tmpColor = [UIColor colorWithPatternImage:bgImg];

    
    return tmpColor;
}





/**
 获取渐变的颜色

 @return 从左往右
 */
+ (UIColor*)getMaingradientColorWithstart_COLOR:(UIColor*)topleftColor  end_COLOR:(UIColor*)bottomrightColor{
    
    
    CGSize size = CGSizeMake(SCREENW, 83.0f);
    
    
    UIImage *bgImg = [UIImage gradientColorImageFromColors:@[topleftColor, bottomrightColor] gradientType:GradientTypeLeftToRight imgSize:size];
    UIColor *tmpColor = [UIColor colorWithPatternImage:bgImg];

    return tmpColor;
}


/**
 关于[UIBarButtonItem alloc] initWithImage:颜色被冲的解决办法

 @param imageNamed <#imageNamed description#>
 @return <#return value description#>
 */
+ (instancetype)getUIImageRenderingModeAlwaysOriginalWithImgName:(NSString*)imageNamed{


UIImage *aimage = [UIImage imageNamed:imageNamed];
UIImage *image = [aimage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    return image;
}


+ (instancetype)gradientColorImageFromColors:(NSArray *)colors frame:(CGRect)frame{
    
    NSMutableArray *arr = [NSMutableArray array];
    for(UIColor *c in colors) {
        [arr addObject:(id)c.CGColor];
    }
    
    UIGraphicsBeginImageContextWithOptions(frame.size, YES, 1);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)arr, NULL);
    
    CGPoint start;
    CGPoint end;
    
    start = CGPointMake(0.0, frame.size.height);
    
    end = CGPointMake(frame.size.width, 0.0);
    
    CGContextDrawLinearGradient(context, gradient, start, end,kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    
    CGContextRestoreGState(context);
    
    CGColorSpaceRelease(colorSpace);
    
    UIGraphicsEndImageContext();
    
    return image;
}

+ (instancetype)gradientColorImageFromColors:(NSArray*)colors gradientType:(GradientType)gradientType imgSize:(CGSize)imgSize {
    NSMutableArray *ar = [NSMutableArray array];
    for(UIColor *c in colors) {
        [ar addObject:(id)c.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(imgSize, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    CGPoint start;
    CGPoint end;
    switch (gradientType) {
        case GradientTypeTopToBottom:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, imgSize.height);
            break;
        case GradientTypeLeftToRight:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imgSize.width, 0.0);
            break;
        case GradientTypeUpleftToLowright:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imgSize.width, imgSize.height);
            break;
        case GradientTypeUprightToLowleft:
            start = CGPointMake(imgSize.width, 0.0);
            end = CGPointMake(0.0, imgSize.height);
            break;
        default:
            break;
    }
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}

+ (instancetype)imageWithOriginalName:(NSString *)imageName{
    
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (instancetype)imageWithStretchableName:(NSString *)imageName{
    
    UIImage *image = [UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
    
+ (instancetype)waterImageWithBgImageName:(NSString *)bgImageName waterImageName:(NSString *)waterImageName scale:(CGFloat)scale{
    // 生成一张有水印的图片，一定要获取UIImage对象 然后显示在imageView上
    
    //创建一背景图片
    UIImage *bgImage = [UIImage imageNamed:bgImageName];
    //NSLog(@"bgImage Size: %@",NSStringFromCGSize(bgImage.size));
    // 1.创建一个位图【图片】，开启位图上下文
    // size:位图大小
    // opaque: alpha通道 YES:不透明/ NO透明 使用NO,生成的更清析
    // scale 比例 设置0.0为屏幕的比例
    // scale 是用于获取生成图片大小 比如位图大小：20X20 / 生成一张图片：（20 *scale X 20 *scale)
    //NSLog(@"当前屏幕的比例 %f",[UIScreen mainScreen].scale);
    UIGraphicsBeginImageContextWithOptions(bgImage.size, NO, scale);
    
    // 2.画背景图
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    
    // 3.画水印
    // 算水印的位置和大小
    // 一般会通过一个比例来缩小水印图片
    UIImage *waterImage = [UIImage imageNamed:waterImageName];
#warning 水印的比例，根据需求而定
    CGFloat waterScale = 0.4;
    CGFloat waterW = waterImage.size.width * waterScale;
    CGFloat waterH = waterImage.size.height * waterScale;
    CGFloat waterX = bgImage.size.width - waterW;
    CGFloat waterY = bgImage.size.height - waterH;
    
    
    [waterImage drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    
    // 4.从位图上下文获取 当前编辑的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    
    // 5.结束当前位置编辑
    UIGraphicsEndImageContext();
    
    
    return newImage;
}
    
+ (instancetype)captureWithView:(UIView *)view{
    //1 开启上下文
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
    //2 将控制器view的layer渲染到上下文
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    //3 取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //4 结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}
    
+ (instancetype)resizedImageWithName:(NSString *)name
    {
        return [self resizedImageWithName:name left:0.5 top:0.5];
    }
    
+ (instancetype)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top
    {
        UIImage *image = [UIImage imageNamed:name];
        return [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height * top];
    }
    
+ (instancetype)squareImageFromImage:(UIImage *)image scaledToSize:(CGFloat)newSize {
    CGAffineTransform scaleTransform;
    CGPoint origin;
    
    if (image.size.width > image.size.height) {
        //image原始高度为200，缩放image的高度为400pixels，所以缩放比率为2
        CGFloat scaleRatio = newSize / image.size.height;
        scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
        //设置绘制原始图片的画笔坐标为CGPoint(-100, 0)pixels
        origin = CGPointMake(-(image.size.width - image.size.height) / 2.0f, 0);
    } else {
        CGFloat scaleRatio = newSize / image.size.width;
        scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
        
        origin = CGPointMake(0, -(image.size.height - image.size.width) / 2.0f);
    }
    
    CGSize size = CGSizeMake(newSize, newSize);
    //创建画板为(400x400)pixels
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    } else {
        UIGraphicsBeginImageContext(size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    //将image原始图片(400x200)pixels缩放为(800x400)pixels
    CGContextConcatCTM(context, scaleTransform);
    //origin也会从原始(-100, 0)缩放到(-200, 0)
    [image drawAtPoint:origin];
    
    //获取缩放后剪切的image图片
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}
    
+ (instancetype)squareImageFromImage:(UIImage *)image placeholderImageName:(NSString *)imageName{
    
    if (!image) {
        return [UIImage imageNamed:imageName];
    }
    
    CGAffineTransform scaleTransform;
    CGFloat newSize = 0;
    CGPoint origin = CGPointZero;
    if (image.size.width == image.size.height) {
        return image;
    }
    if (image.size.width >= image.size.height) {
        newSize = image.size.width;
        //缩放比例
        CGFloat scaleRatio = image.size.width / image.size.height;
        scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
        origin = CGPointMake(-(image.size.width - image.size.height) / 2.0f, 0);
    } else{
        newSize = image.size.height;
        CGFloat scaleRatio = image.size.height / image.size.width;
        scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
        origin = CGPointMake(-(image.size.height - image.size.width) / 2.0f, 0);
    }
    
    CGSize size = CGSizeMake(newSize, newSize);
    //创建正方形画板为(400x400)
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    } else {
        UIGraphicsBeginImageContext(size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置图片默认背景色[白色]
    CGContextAddRect(context, CGRectMake(0, 0, newSize, newSize));
    [[UIColor whiteColor] set];
    CGContextFillPath(context);
    
    //将image原始图片scaleRatio比例缩放
    CGContextConcatCTM(context, scaleTransform);
    //origin也会从原始(-100, 0)缩放到(-200, 0)
    [image drawAtPoint:origin];
    
    //获取缩放后剪切的image图片
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

- (instancetype)drawLineOfDashByImageView:(UIImageView *)imageView{
    // 开始划线 划线的frame
    UIGraphicsBeginImageContext(imageView.frame.size);
    
    [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
    
    // 获取上下文
    CGContextRef line = UIGraphicsGetCurrentContext();
    
    // 设置线条终点的形状
    CGContextSetLineCap(line, kCGLineCapRound);
    // 设置虚线的长度 和 间距
    CGFloat lengths[] = {5,5};
    
    CGContextSetStrokeColorWithColor(line, [UIColor greenColor].CGColor);
    // 开始绘制虚线
    CGContextSetLineDash(line, 0, lengths, 2);
    
    CGContextMoveToPoint(line, 0.0, 2.0);
    
    CGContextAddLineToPoint(line, 300, 2.0);
    
    CGContextStrokePath(line);
    
    // UIGraphicsGetImageFromCurrentImageContext()返回的就是image
    return UIGraphicsGetImageFromCurrentImageContext();
}

+ (instancetype)sizeImageFromImage:(UIImage *)image scaledToSize:(CGSize)newSize{
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
    
+ (instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
    {
        // 1.加载原图
        UIImage *oldImage = [UIImage imageNamed:name];
        
        // 2.开启上下文
        CGFloat imageW = oldImage.size.width + 2 * borderWidth;
        CGFloat imageH = oldImage.size.height + 2 * borderWidth;
        CGSize imageSize = CGSizeMake(imageW, imageH);
        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
        
        // 3.取得当前的上下文
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        // 4.画边框(大圆)
        [borderColor set];
        CGFloat bigRadius = imageW * 0.5; // 大圆半径
        CGFloat centerX = bigRadius; // 圆心
        CGFloat centerY = bigRadius;
        CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
        CGContextFillPath(ctx); // 画圆
        
        // 5.小圆
        CGFloat smallRadius = bigRadius - borderWidth;
        CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
        // 裁剪(后面画的东西才会受裁剪的影响)
        CGContextClip(ctx);
        
        // 6.画图
        [oldImage drawInRect:CGRectMake(borderWidth, borderWidth, oldImage.size.width, oldImage.size.height)];
        
        // 7.取图
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        // 8.结束上下文
        UIGraphicsEndImageContext();
        
        return newImage;
    }
    
+ (instancetype)circleImageWithImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
    {
        // 1.加载原图
        UIImage *oldImage = image;
        
        // 2.开启上下文
        CGFloat imageW = oldImage.size.width + 2 * borderWidth;
        CGFloat imageH = oldImage.size.height + 2 * borderWidth;
        CGSize imageSize = CGSizeMake(imageW, imageH);
        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
        
        // 3.取得当前的上下文
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        // 4.画边框(大圆)
        [borderColor set];
        CGFloat bigRadius = imageW * 0.5; // 大圆半径
        CGFloat centerX = bigRadius; // 圆心
        CGFloat centerY = bigRadius;
        CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
        CGContextFillPath(ctx); // 画圆
        
        // 5.小圆
        CGFloat smallRadius = bigRadius - borderWidth;
        CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
        // 裁剪(后面画的东西才会受裁剪的影响)
        CGContextClip(ctx);
        
        // 6.画图
        [oldImage drawInRect:CGRectMake(borderWidth, borderWidth, oldImage.size.width, oldImage.size.height)];
        
        // 7.取图
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        // 8.结束上下文
        UIGraphicsEndImageContext();
        
        return newImage;
    }
    
    /**
     *  返回主bundle的图片对象
     *
     */
+ (instancetype)imageFromMainBundleWithName:(NSString *)name{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:name ofType:nil];
    return [UIImage imageWithContentsOfFile:imagePath];
    
}

    // 根据图片url获取图片尺寸
+ (CGSize)getImageSizeWithURL:(id)imageURL
    {
        NSURL* URL = nil;
        
        if([imageURL isKindOfClass:[NSURL class]])
        URL = imageURL;
        
        if([imageURL isKindOfClass:[NSString class]])
        URL = [NSURL URLWithString:imageURL];
        
        if(URL == nil)
        return CGSizeZero;
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:URL];
        NSString* pathExtendsion = [URL.pathExtension lowercaseString];
        
        CGSize size = CGSizeZero;
        
        if([pathExtendsion isEqualToString:@"png"])
        size =  [self getPNGImageSizeWithRequest:request];
        else if([pathExtendsion isEqual:@"gif"])
        size =  [self getGIFImageSizeWithRequest:request];
        else
        size = [self getJPGImageSizeWithRequest:request];
        
        if(CGSizeEqualToSize(CGSizeZero, size))                    // 如果获取文件头信息失败,发送异步请求请求原图
        {
            NSData* data = [NSURLConnection sendSynchronousRequest:[NSURLRequest requestWithURL:URL] returningResponse:nil error:nil];
            UIImage* image = [UIImage imageWithData:data];
            
            if(image)
            size = image.size;
        }
        
        return size;
    }
    
    //  获取PNG图片的大小
+ (CGSize)getPNGImageSizeWithRequest:(NSMutableURLRequest*)request
    {
        [request setValue:@"bytes=16-23" forHTTPHeaderField:@"Range"];
        NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        if(data.length == 8)
        {
            int w1 = 0, w2 = 0, w3 = 0, w4 = 0;
            [data getBytes:&w1 range:NSMakeRange(0, 1)];
            [data getBytes:&w2 range:NSMakeRange(1, 1)];
            [data getBytes:&w3 range:NSMakeRange(2, 1)];
            [data getBytes:&w4 range:NSMakeRange(3, 1)];
            int w = (w1 << 24) + (w2 << 16) + (w3 << 8) + w4;
            int h1 = 0, h2 = 0, h3 = 0, h4 = 0;
            [data getBytes:&h1 range:NSMakeRange(4, 1)];
            [data getBytes:&h2 range:NSMakeRange(5, 1)];
            [data getBytes:&h3 range:NSMakeRange(6, 1)];
            [data getBytes:&h4 range:NSMakeRange(7, 1)];
            int h = (h1 << 24) + (h2 << 16) + (h3 << 8) + h4;
            return CGSizeMake(w, h);
        }
        
        return CGSizeZero;
    }
    
    //  获取gif图片的大小
+ (CGSize)getGIFImageSizeWithRequest:(NSMutableURLRequest*)request
    {
        [request setValue:@"bytes=6-9" forHTTPHeaderField:@"Range"];
        NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        if(data.length == 4)
        {
            short w1 = 0, w2 = 0;
            [data getBytes:&w1 range:NSMakeRange(0, 1)];
            [data getBytes:&w2 range:NSMakeRange(1, 1)];
            short w = w1 + (w2 << 8);
            short h1 = 0, h2 = 0;
            [data getBytes:&h1 range:NSMakeRange(2, 1)];
            [data getBytes:&h2 range:NSMakeRange(3, 1)];
            short h = h1 + (h2 << 8);
            return CGSizeMake(w, h);
        }
        
        return CGSizeZero;
    }
    
    //  获取jpg图片的大小
+ (CGSize)getJPGImageSizeWithRequest:(NSMutableURLRequest*)request
    {
        [request setValue:@"bytes=0-209" forHTTPHeaderField:@"Range"];
        NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        if ([data length] <= 0x58)
        return CGSizeZero;
        
        if ([data length] < 210)
        {// 肯定只有一个DQT字段
            short w1 = 0, w2 = 0;
            [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
            [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
            short w = (w1 << 8) + w2;
            short h1 = 0, h2 = 0;
            [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
            [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
            short h = (h1 << 8) + h2;
            return CGSizeMake(w, h);
        }
        else
        {
            short word = 0x0;
            [data getBytes:&word range:NSMakeRange(0x15, 0x1)];
            
            if (word == 0xdb)
            {
                [data getBytes:&word range:NSMakeRange(0x5a, 0x1)];
                if (word == 0xdb)
                {// 两个DQT字段
                    short w1 = 0, w2 = 0;
                    [data getBytes:&w1 range:NSMakeRange(0xa5, 0x1)];
                    [data getBytes:&w2 range:NSMakeRange(0xa6, 0x1)];
                    short w = (w1 << 8) + w2;
                    short h1 = 0, h2 = 0;
                    [data getBytes:&h1 range:NSMakeRange(0xa3, 0x1)];
                    [data getBytes:&h2 range:NSMakeRange(0xa4, 0x1)];
                    short h = (h1 << 8) + h2;
                    return CGSizeMake(w, h);
                }
                else
                {// 一个DQT字段
                    short w1 = 0, w2 = 0;
                    [data getBytes:&w1 range:NSMakeRange(0x60, 0x1)];
                    [data getBytes:&w2 range:NSMakeRange(0x61, 0x1)];
                    short w = (w1 << 8) + w2;
                    short h1 = 0, h2 = 0;
                    [data getBytes:&h1 range:NSMakeRange(0x5e, 0x1)];
                    [data getBytes:&h2 range:NSMakeRange(0x5f, 0x1)];
                    short h = (h1 << 8) + h2;
                    return CGSizeMake(w, h);
                }
            }
            else
            {
                return CGSizeZero;
            }
        }
    }




- (UIImage *)compressWithTargetPixel:(NSUInteger)targetPx {
    
    UIImage *newImage = nil;
    
    CGSize imageSize = self.size;
    CGFloat width = imageSize.width * self.scale;
    CGFloat height = imageSize.height * self.scale;
    
    // 是否重绘
    BOOL drawImge = NO;
    
    // 压缩后的尺寸
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetPx;
    CGFloat scaledHeight = targetPx;
    
    // 1. 图片宽高均 ≤ 参照像素，图片尺寸保持不变
    if (width <= targetPx && height <= targetPx) {
        newImage = self;
    }
    
    // 2. 宽或高均 ＞ 参照像素
    else if (width > targetPx && height > targetPx) {
        
        drawImge = YES;
        CGFloat factor = width / height;
        
        if (factor <= 2) {
            // 2.1 图片宽高比 ≤ 2，则将图片宽或者高取大的等比压缩至1280px
            if (width > height) {
                scaleFactor  = targetPx / width;
            } else {
                scaleFactor = targetPx / height;
            }
        } else {
            // 2.2 图片宽高比 ＞ 2时，则宽或者高取小的等比压缩至1280px
            if (width > height) {
                scaleFactor  = targetPx / height;
            } else {
                scaleFactor = targetPx / width;
            }
        }
    }
    
    // 3. 宽高一个 ＞= 1280px，另一个 ＜ 1280px; 宽 >= 1280
    else if (width >= targetPx && height < targetPx ) {
        if (width / height > 2) {
            newImage = self;
        } else {
            drawImge = YES;
            scaleFactor = targetPx / width;
        }
    }
    // 4. 宽高一个 ＞= 1280px，另一个 ＜ 1280px 高 >= 1280
    else if (width < targetPx &&  height >= targetPx) {
        if (height / width > 2) {
            newImage = self;
        } else {
            drawImge = YES;
            scaleFactor = targetPx / height;
        }
    }
    
    if (drawImge == YES) {
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(scaledWidth/self.scale, scaledHeight/self.scale), YES, [UIScreen mainScreen].scale);
        [self drawInRect:CGRectMake(0, 0, scaledWidth/self.scale, scaledHeight/self.scale)];
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    if (newImage == nil) {
        newImage = self;
    }
    
    newImage = [UIImage imageWithData:UIImageJPEGRepresentation(newImage, 0.7) scale:newImage.scale];
    
    return newImage;
}



@end
