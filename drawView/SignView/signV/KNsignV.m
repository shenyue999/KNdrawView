//
//  KNsignV.m
//  drawView
//
//  Created by mac on 2020/11/5.
//  Copyright © 2020 https://kunnan.blog.csdn.net        . All rights reserved.

#define SPACE           10
#define BUTTON_WIDTH    100
#define BUTTON_HEIGHT   50


#import "KNsignV.h"
#import "NSStringQCTtoll.h"

@implementation KNsignV

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame ViewModel:nil];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    return [self initWithFrame:CGRectZero ViewModel:nil];
}

- (instancetype)initWithViewModel:(id)ViewModel {
    return [self initWithFrame:CGRectZero ViewModel:ViewModel];
}

- (instancetype)initWithFrame:(CGRect)frame ViewModel:(KNSignatureViewModel*)viewModel {
    
    if (self = [super initWithFrame:frame]) {
        
        
        _viewModel = viewModel;
        if(viewModel !=nil){
            
            self.placeHoalder= viewModel.signVPlaceHoalder;
            
            

        }
        self.pointXs = [NSMutableArray arrayWithCapacity:0];
        self.pointYs = [NSMutableArray arrayWithCapacity:0];
        [self createubView];

        
    }
    return self;
}





- (CRMsignBottomView *)signBottomView{
    if(nil == _signBottomView){
        
        _signBottomView = [CRMsignBottomView new];
        
        
        [self addSubview:_signBottomView];
        
        __weak __typeof__(self) weakSelf = self;

        [_signBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.signImageView.mas_bottom);
            
            make.left.right.bottom.equalTo(weakSelf);
            
        }];
        
        [_signBottomView setSignDoneActionblock:^(id  _Nonnull sender) {
           
            [weakSelf signDoneAction:sender];
        }];
        //
        
        [_signBottomView setClearSignActionBlock:^(id  _Nonnull sender) {
           
            [weakSelf clearSignAction:sender];
        }];
        
        [_signBottomView setUser_Agreement_and_Privacy_PolicySubjectBlock:^(id  _Nonnull sender) {
           
//            [weakSelf clearSignAction:sender];
            if(weakSelf.User_Agreement_and_Privacy_PolicySubjectBlock){
                weakSelf.User_Agreement_and_Privacy_PolicySubjectBlock(sender);
                
            }
        }];
           



    }
    
    return _signBottomView;
    
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.isSwiping = NO;
    UITouch * touch = touches.anyObject;
    self.lastPoint = [touch locationInView:self.signImageView];
    if (self.lastPoint.x > 0) {
        self.placeHoalderLabel.text = nil;
    }
    [self.pointXs addObject:[NSNumber numberWithFloat:self.lastPoint.x]];
    [self.pointYs addObject:[NSNumber numberWithFloat:self.lastPoint.y]];
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.isSwiping = YES;
    
    UITouch * touch = touches.anyObject;
    
    
    CGPoint currentPoint = [touch locationInView:self.signImageView];
    
    
    UIGraphicsBeginImageContext(self.signImageView.frame.size);
    
    
    
    [self.signImageView.image drawInRect:(CGRectMake(0, 0, self.signImageView.frame.size.width, self.signImageView.frame.size.height))];
    
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), self.lastPoint.x, self.lastPoint.y);
    
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    
    CGContextSetLineCap(UIGraphicsGetCurrentContext(),kCGLineCapRound);
    
    CGFloat lineWidth = 3.3;
    
    if (self.lineWidth) {
        
        lineWidth = self.lineWidth;
    }
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), lineWidth);
    
    CGFloat red = 0.0, green = 0.0, blue = 0.0;
    if (self.lineColor) {
        
        NSDictionary *rgbDic = [self RGBDictionaryByColor:self.lineColor];
        
        red = [rgbDic[@"red"] floatValue];
        
        green = [rgbDic[@"green"] floatValue];
        
        blue = [rgbDic[@"blue"] floatValue];
        
    }
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(),red, green, blue, 1.0);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    
    self.signImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    self.lastPoint = currentPoint;
    
    [self.pointXs addObject:[NSNumber numberWithFloat:self.lastPoint.x]];
    
    [self.pointYs addObject:[NSNumber numberWithFloat:self.lastPoint.y]];
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if(!self.isSwiping) {
        UIGraphicsBeginImageContext(self.signImageView.frame.size);
        [self.signImageView.image drawInRect:(CGRectMake(0, 0, self.signImageView.frame.size.width, self.signImageView.frame.size.height))];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 3.0);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 1.0);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), self.lastPoint.x, self.lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), self.lastPoint.x, self.lastPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        self.signImageView.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
}
#pragma mark getter && setter
- (void)signDoneAction:(UIButton *)sender {
    if (self.signDone) {
        self.signDone(self.signImageView.image);
    }
}

- (void)clearSignAction:(UIButton *)sender {
    if (self.signClear) {
        self.signClear(self);
    }
}
- (void)clearSignature {
    self.signImageView.image = nil;
    self.placeHoalderLabel.hidden = NO;
    if (self.placeHoalder) {
        self.placeHoalderLabel.text = self.placeHoalder;
    } else {
        self.placeHoalderLabel.text = @"签名区域";
    }
}

- (NSDictionary *)RGBDictionaryByColor:(UIColor *)color {
    CGFloat red = 0, green = 0, blue = 0, alpha = 0;
    if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [color getRed:&red green:&green blue:&blue alpha:&alpha];
    } else {
        const CGFloat *compoments = CGColorGetComponents(color.CGColor);
        red = compoments[0];
        green = compoments[1];
        blue = compoments[2];
        alpha = compoments[3];
    }
    return @{@"red":@(red), @"green":@(green), @"blue":@(blue), @"alpha":@(alpha)};
}


- (void)setPlaceHoalderTextFont:(UIFont *)placeHoalderTextFont{
    _placeHoalderTextFont = placeHoalderTextFont;
    
    self.placeHoalderLabel.font = _placeHoalderTextFont;
}


- (void)createubView{
    
        CGSize size = self.frame.size;
    
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SPACE, SPACE, size.width-SPACE*2, size.height-SPACE*3-BUTTON_HEIGHT)];
    
     imageView = [UIImageView new];

//        imageView.layer.cornerRadius = SPACE;
        imageView.layer.masksToBounds = YES;
    
        imageView.backgroundColor = [UIColor clearColor];
        self.signImageView = imageView;
    
        [self addSubview:imageView];
    
    __weak __typeof__(self) weakSelf = self;

    
    [self.signImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        
        make.top.equalTo(weakSelf);
        make.left.equalTo(weakSelf);
        make.right.equalTo(weakSelf);
        make.bottom.equalTo(weakSelf.signBottomView.mas_top);
        

    }];
    
    
    
    
    
    
        CRMplaceHoalderLabel *placeHoalderLabel = [[CRMplaceHoalderLabel alloc] initWithFrame:CGRectMake(0, (size.height-100)/2.0, imageView.frame.size.width, 100)];
    

        placeHoalderLabel.textAlignment = NSTextAlignmentLeft;
    
        placeHoalderLabel.alpha = 0.8;
        if (self.placeHoalder) {
            placeHoalderLabel.text = self.placeHoalder;
        } else {
            placeHoalderLabel.text = @"签名区域";
        }
        if (self.placeHoalderTextFont) {
            placeHoalderLabel.font = self.placeHoalderTextFont;
        } else {
            placeHoalderLabel.font = [UIFont systemFontOfSize:35];
        }
        if (self.placeHoalderTextColor) {
            placeHoalderLabel.textColor = self.placeHoalderTextColor;
        } else {
            placeHoalderLabel.textColor = [UIColor grayColor];
        }
        self.placeHoalderLabel = placeHoalderLabel;
    
    
    
    
    

    self.placeHoalderLabel.contentEdgeInsets = UIEdgeInsetsMake(kAdjustRatio(10), kAdjustRatio(10), kAdjustRatio(10), 0);
    placeHoalderLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];

    
                [RACObserve(self.placeHoalderLabel,text ) subscribeNext:^(id x) {
                    
                    
                    if([NSStringQCTtoll isBlankString:x]){
                        
                        
                        
                        
                        
                        self.placeHoalderLabel.contentEdgeInsets = UIEdgeInsetsZero;
                        placeHoalderLabel.backgroundColor = [UIColor whiteColor];


                    }else{
                        
                        
                        self.placeHoalderLabel.contentEdgeInsets = UIEdgeInsetsMake(kAdjustRatio(10), kAdjustRatio(10), kAdjustRatio(10), 0);
                        
                        
                        placeHoalderLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
                        
                        


                        
                    }
                    
                }];

    
    [self addSubview:placeHoalderLabel];

    
    [self.placeHoalderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        
        make.width.equalTo(weakSelf);
        
        make.centerX.equalTo(weakSelf);
        make.top.equalTo(weakSelf.signImageView);
        

    }];

        
    
    [self signBottomView];
    //signViewplaceHoalderLabel
    
    
    if (self.signImage) {
        imageView.image = self.signImage;
        placeHoalderLabel.hidden = YES;
    }

    

}




@end
