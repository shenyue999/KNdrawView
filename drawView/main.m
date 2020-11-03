//
//  main.m
//  drawView
//
//  Created by mac on 2020/11/3.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

/**
 
 */
#import "KNApplication4sendEvent.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    
    NSString * principalClassName;// The name of the UIApplication class or subclass. If you specify nil, UIApplication is assumed.


    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
        principalClassName =   NSStringFromClass([KNApplication4sendEvent class]);
        
        
        
        
        
        
    }
    

    return UIApplicationMain(argc, argv, principalClassName, appDelegateClassName);
    
    
}
