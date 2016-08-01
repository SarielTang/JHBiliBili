//
//  ShinBanViewController.m
//  BiliBili
//
//  Created by apple-jd44 on 15/10/28.
//  Copyright © 2015年 JimHuang. All rights reserved.
//

#import "ShinBanViewController.h"
#import "ShiBanPlayTableViewController.h"
#import "ShiBanInfoViewController.h"

#import "ShiBanHeadHeaderFooterView.h"
#import "ShiBanHeadTableViewCell.h"
#import "ShiBanRecommedShiBanTableViewCell.h"

#import "ShinBanViewModel.h"

@interface ShinBanViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) ShinBanViewModel* vm;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIButton *everyDayPlay;
@property (strong, nonatomic) UIButton *shinBanIndex;
@property (strong, nonatomic) NSMutableDictionary *cellHeightDic;
@end

@implementation ShinBanViewController
#pragma mark - 方法
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [self.tableView.mj_header beginRefreshing];
}

- (void)colorSetting{
    self.tableView.backgroundColor = [[ColorManager shareColorManager] colorWithString:@"backgroundColor"];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        ShiBanHeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShiBanHeadTableViewCell" forIndexPath:indexPath];
        [cell changeTheme];
        
        @weakify(self)
        [cell setTouchButtonCallBack:^(NSUInteger tag) {
            @strongify(self)
            if (!self) return;
            
            if (tag == 100) {
                ShiBanPlayTableViewController *vc = [[ShiBanPlayTableViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
        }];
        self.cellHeightDic[indexPath] = @80.0f;
        return cell;
    }
    
    ShiBanRecommedShiBanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShiBanRecommedShiBanTableViewCell" forIndexPath:indexPath];
    [cell changeTheme];
    self.cellHeightDic[indexPath] = @([cell cellHeightWithModels:self.vm.recommentList]);
    @weakify(self)
    [cell setTouchItemCallBack:^(RecommentShinBanDataModel *model) {
        @strongify(self)
        ShiBanInfoViewController* avc = [[ShiBanInfoViewController alloc] init];
        [avc setWithModel:model];
        [self.navigationController pushViewController:avc animated:YES];
    }];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.cellHeightDic[indexPath] floatValue];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        ShiBanHeadHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"ShiBanHeadHeaderFooterView"];
        view.iconImageView.image = [UIImage imageNamed:@"ic_category_promo"];
        view.titleLabel.text = @"推荐番剧";
        [view changeTheme];
        return view;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 0 ? 0.1 : 40;
}

#pragma mark - 懒加载
- (ShinBanViewModel *)vm{
    if (_vm == nil) {
        _vm = [ShinBanViewModel new];
    }
    return _vm;
}

- (NSMutableDictionary *)cellHeightDic {
	if(_cellHeightDic == nil) {
		_cellHeightDic = [[NSMutableDictionary alloc] init];
	}
	return _cellHeightDic;
}

- (UITableView *)tableView {
	if(_tableView == nil) {
		_tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ShiBanHeadTableViewCell class] forCellReuseIdentifier:@"ShiBanHeadTableViewCell"];
        [_tableView registerClass:[ShiBanRecommedShiBanTableViewCell class] forCellReuseIdentifier:@"ShiBanRecommedShiBanTableViewCell"];
        [_tableView registerClass:[ShiBanHeadHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"ShiBanHeadHeaderFooterView"];
        _tableView.sectionFooterHeight = 0.1;
        @weakify(self)
        _tableView.mj_header = [MyRefreshComplete myRefreshHead:^{
            @strongify(self)
            [self.vm refreshDataCompleteHandle:^(NSError *error) {
                if (!self) return;
                
                [self.tableView.mj_header endRefreshing];
                [self.tableView reloadData];
            }];
        }];
        _tableView.mj_footer = [MyRefreshComplete myRefreshFoot:^{
            @strongify(self)
            [self.vm getMoreDataCompleteHandle:^(NSError *error) {
                if (!self) return;
                
                [self.tableView.mj_footer endRefreshing];
                [self.tableView reloadData];
            }];
        }];
        [self.view addSubview:_tableView];
	}
	return _tableView;
}

@end
