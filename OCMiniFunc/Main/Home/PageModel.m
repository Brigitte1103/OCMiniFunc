//
//  PageModel.m
//  OCMiniFunc
//
//  Created by Brigitte on 2018/5/14.
//  Copyright © 2018年 fxe. All rights reserved.
//

#import "PageModel.h"

@interface PageModel()

@property (nonatomic, copy)NSString *title;
@property (nonatomic, assign)Class targetVcClass;

@end

@implementation PageModel



+ (instancetype)initWithTitle:(NSString *)title targetVcClass:(Class)targetVcClass{
    PageModel *pageModel = [[PageModel alloc] init];
    if (pageModel) {
        pageModel.title = title;
        pageModel.targetVcClass = targetVcClass;
    }
    
    return pageModel;
}

@end
