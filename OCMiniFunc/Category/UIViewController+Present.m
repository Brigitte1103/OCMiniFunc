//
//  UIViewController+Present.m
//  OCMiniFunc
//
//  Created by Brigitte on 2018/5/22.
//  Copyright © 2018年 fxe. All rights reserved.
//

#import "UIViewController+Present.h"
#import <objc/runtime.h>

@implementation UIViewController (Present)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method presentM = class_getInstanceMethod(self.class, @selector(presentViewController:animated:completion:));
        Method presentSwizzlingM = class_getInstanceMethod(self.class, @selector(swizz_presentViewController:animated:completion:));
        
        method_exchangeImplementations(presentM, presentSwizzlingM);
    });

    
}

- (void)swizz_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    
    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
        NSLog(@"title: %@", ((UIAlertController *)viewControllerToPresent).title);
        NSLog(@"message: %@", ((UIAlertController *)viewControllerToPresent).message);
        
        UIAlertController *alertController = (UIAlertController *)viewControllerToPresent;
        if (alertController.title == nil && alertController.message == nil) {
            return;
        }else{
            [self swizz_presentViewController:viewControllerToPresent animated:flag completion:completion];
            return;
        }
    }
    
    [self swizz_presentViewController:viewControllerToPresent animated:flag completion:completion];
}

@end
