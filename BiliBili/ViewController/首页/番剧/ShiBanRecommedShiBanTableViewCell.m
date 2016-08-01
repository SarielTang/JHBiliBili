//
//  ShiBanRecommedShiBanTableViewCell.m
//  BiliBili
//
//  Created by JimHuang on 16/8/1.
//  Copyright © 2016年 JimHuang. All rights reserved.
//

#import "ShiBanRecommedShiBanTableViewCell.h"
#import "ShiBanRecommentCollectionViewCell.h"

#define COL_NUM 3
#define COL_EDGE 10

@interface ShiBanRecommedShiBanTableViewCell ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) UICollectionView *collectionView;
@end

@implementation ShiBanRecommedShiBanTableViewCell
{
    NSArray <RecommentShinBanDataModel *>*_itemArr;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.height.mas_equalTo(0);
        }];
    }
    return self;
}

- (CGFloat)cellHeightWithModels:(NSArray *)models {
    _itemArr = models;
    [self.collectionView reloadData];
    float cellHeight = self.collectionView.collectionViewLayout.collectionViewContentSize.height;
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(cellHeight);
    }];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
    return cellHeight;
}

- (void)changeTheme {
    self.collectionView.backgroundColor = [[ColorManager shareColorManager] colorWithString:@"backgroundColor"];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _itemArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RecommentShinBanDataModel *model = _itemArr[indexPath.item];
    ShiBanRecommentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ShiBanRecommentCollectionViewCell" forIndexPath:indexPath];
    [cell setUpProperty];
    [cell.imgView yy_setImageWithURL:[NSURL URLWithString:model.cover] options:YY_WEB_IMAGE_OPTION];
    cell.titleLabel.text = model.title;
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    RecommentShinBanDataModel *model = _itemArr[indexPath.item];
    if (self.touchItemCallBack) {
        self.touchItemCallBack(model);
    }
}


#pragma mark - 懒加载
- (UICollectionView *)collectionView {
	if(_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        CGFloat width = (kWindowW - 2 * COL_EDGE - (COL_NUM - 1) * layout.minimumInteritemSpacing) / COL_NUM;
        layout.itemSize = CGSizeMake(width, width / 0.7 + 30);
		_collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.scrollEnabled = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[ShiBanRecommentCollectionViewCell class] forCellWithReuseIdentifier:@"ShiBanRecommentCollectionViewCell"];
        [self.contentView addSubview:_collectionView];
	}
	return _collectionView;
}

@end
