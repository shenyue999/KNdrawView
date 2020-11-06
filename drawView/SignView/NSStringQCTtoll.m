//
//  NSString+QCTtoll.m
//  retail
//
//  Created by mac on 2019/9/20.
//  Copyright © 2019 QCT. All rights reserved.
//

#import "NSStringQCTtoll.h"

@implementation NSStringQCTtoll




+(NSString*)getBlankStringWith__:(NSString*   ) string{
    
    
    
    
    return  [NSStringQCTtoll isBlankString:string]? @"--" : string;
}

+(BOOL)isBlankString:(NSString*   ) string{
    
// NSString*   string = self;
    
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([string isKindOfClass:[NSString class]] ) {
        
        if(string.length <1){
            return YES;

        }
        
    }
//    string = [NSString stringWithFormat:@"%@",string];
    string = [NSString stringWithFormat:@"%@",string];

//    if([string isKindOfClass:NSString.class]){
        if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
            return YES;
        }

//    }
    
    
    return NO;
}
@end
