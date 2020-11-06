//
//  ImageTools.h
//  DoctorAssistant

//

#import <Foundation/Foundation.h>
#import <UIkit/UIKit.h>

@interface ImageTools : NSObject


    
+ (UIImage *) createImageWithColor: (UIColor *) color;
+ (UIImage *) createImageWithColor: (UIColor *) color withRect:(CGRect) rect;
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;
+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;
+(UIImage *) imageCompressForSize:(UIImage *)sourceImage targetSize:(CGSize)size;
+(UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;
@end
