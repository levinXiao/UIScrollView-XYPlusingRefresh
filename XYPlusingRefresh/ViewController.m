//
//  ViewController.m
//  XYPlusingRefresh
//
//  Created by xiaoyu on 16/5/20.
//  Copyright © 2016年 xiaoyu. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+XYPlusingRefresh.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>{
    UITableView *table;
    
    int tableCount;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor redColor];
    
    
    UIButton *autoRefreshButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    autoRefreshButton.frame = (CGRect){20,30,100,30};
    [autoRefreshButton setTitle:@"auto refresh" forState:UIControlStateNormal];
    [autoRefreshButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [autoRefreshButton addTarget:self action:@selector(autoRefreshButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:autoRefreshButton];
    
    
    table = [[UITableView alloc] initWithFrame:(CGRect){0,120,self.view.bounds.size.width,self.view.bounds.size.height-240} style:UITableViewStylePlain];
    [self.view addSubview:table];
    
    table.dataSource = self;
    table.delegate = self;
    table.rowHeight = 44;
    tableCount = 40;
    
    [table initDownRefreshCompletion:^(id refreshView) {
        tableCount = 40;
        [table reloadData];
        [refreshView endDownRefresh];
    }];
    
    [table initPullUpRefreshCompletion:^(id refreshView) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            tableCount += 10;
            [table reloadData];
            [refreshView endPullUpRefresh];
        });
    }];
}

-(void)autoRefreshButtonClick{
    [table autoRefresh];
}

-(NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableCount > 80) {
        table.noMoreDataToPullUpRefresh = YES;
    }
    return tableCount;
}

-(UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"1"];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor blackColor];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
