//
//  AppIconController.m
//  OCMiniFunc
//
//  Created by Brigitte on 2018/5/14.
//  Copyright © 2018年 fxe. All rights reserved.
//

#import "AppIconController.h"

@interface AppIconController ()

@end

@implementation AppIconController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
}


- (void)setupView{
    
    if (@available(iOS 10.3, *)) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:@"更换头像" forState:(UIControlStateNormal)];
        btn.center = self.view.center;
        btn.bounds = CGRectMake(0, 0, 100, 50);
        [btn addTarget:self action:@selector(alternateAppIcon:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn2 setTitle:@"默认头像" forState:(UIControlStateNormal)];
        btn2.frame = CGRectMake(self.view.center.x - 50, self.view.center.y + 50, 100, 50);
        [btn2 addTarget:self action:@selector(defaultAppIcon:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn2];
    }else{
        self.navigationItem.title = @"需要10.3以上系统喔";
    }
    
}


- (void)alternateAppIcon:(UIButton *)sender{
    if ([[UIApplication sharedApplication].alternateIconName isEqualToString:@"catIcon1"]) {
        [self changeAppIcon:@"catIcon2"];
    } else {
        [self changeAppIcon:@"catIcon1"];
    }
}


- (void)defaultAppIcon:(UIButton *)sender{
    [self changeAppIcon: nil];
}


- (void)changeAppIcon:(NSString *)imageName{
    [[UIApplication sharedApplication] setAlternateIconName:imageName completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"修改AppIcon出错了: %@", error.description);
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
