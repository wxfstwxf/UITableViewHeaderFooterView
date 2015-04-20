//
//  ViewController.m
//  UITableViewHeaderFooterView
//
//  Created by Felix Wu on 4/19/15.
//  Copyright (c) 2015 Felix Wu. All rights reserved.
//

#import "ViewController.h"
#import "CustomHeader.h"
#import "CustomHeaderView.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(strong,nonatomic) UITableView *tableView;
@property(strong,nonatomic) NSMutableArray *data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.data = [[NSMutableArray alloc] init];
    for (int i = 0; i <= 5; i++) {
        [_data addObject:@{@"breakfast":@"牛奶",@"lunch":@"宫爆鸡丁,米饭",@"Dessert":@"南瓜饼"}];
    }
    self.tableView = [[UITableView alloc] init];
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCellIdentifier"];
    [self.tableView registerClass:[CustomHeaderView class] forHeaderFooterViewReuseIdentifier:@"CustomHeaderIdentifier"];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCellIdentifier"];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"早餐";
            cell.detailTextLabel.text = [[_data objectAtIndex:indexPath.section] objectForKey:@"breakfast"];
            break;
        case 1:
            cell.textLabel.text = @"午餐";
            cell.detailTextLabel.text = [[_data objectAtIndex:indexPath.section] objectForKey:@"lunch"];
            break;
        case 2:
            cell.textLabel.text = @"点心";
            cell.detailTextLabel.text = [[_data objectAtIndex:indexPath.section] objectForKey:@"Dessert"];
            break;
        default:
            break;
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _data.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CustomHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"CustomHeaderIdentifier"];
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60;
}

//去掉UItableview headerview黏性(sticky)
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView)
    {
        CGFloat sectionHeaderHeight = 60; //sectionHeaderHeight
        if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y >= sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
