//
//  PageModel.h
//  OCMiniFunc
//
//  Created by Brigitte on 2018/5/14.
//  Copyright © 2018年 fxe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PageModel : NSObject

@property (nonatomic, copy, readonly)NSString *title;
@property (nonatomic, assign, readonly)Class targetVcClass;

+ (instancetype) initWithTitle:(NSString *)title targetVcClass:(Class)targetVcClass;

@end
