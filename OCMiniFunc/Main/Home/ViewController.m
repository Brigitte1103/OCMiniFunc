//
//  ViewController.m
//  OCMiniFunc
//
//  Created by Brigitte on 2018/5/14.
//  Copyright © 2018年 fxe. All rights reserved.
//

#import "ViewController.h"
#import "PageModel.h"
#import "AppIconController.h"

static NSString *const identifier = @"cellIdentifier";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic,strong) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
    [self setupTableView];
}


- (void)setupNav{
    self.navigationItem.title = @"OCMiniFunc";
    if (@available(iOS 11.0, *)) {
        self.navigationController.navigationBar.prefersLargeTitles = YES;
        self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAutomatic;
        self.navigationController.navigationBar.largeTitleTextAttributes = @{NSForegroundColorAttributeName:[UIColor orangeColor],
                                                                             NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:28.f]
                                                                             };
    }
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:nil];
}

- (void)setupTableView{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
}


#pragma mark --tableView delegate && dataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath { 

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    PageModel *model = self.dataSource[indexPath.row];
    cell.textLabel.text = model.title;
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return self.dataSource.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PageModel *model = self.dataSource[indexPath.row];
    UIViewController *targetVC = [[model.targetVcClass alloc] init];
    targetVC.navigationItem.title = model.title;
    targetVC.view.backgroundColor = [UIColor whiteColor];
    targetVC.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;
    [self.navigationController pushViewController:targetVC animated:YES];
}

- (NSArray *) dataSource{
    if (!_dataSource) {
        PageModel *model = [PageModel initWithTitle:@"动态修改AppIcon" targetVcClass:[AppIconController class]];
        _dataSource = @[model];
    }
    return _dataSource;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
