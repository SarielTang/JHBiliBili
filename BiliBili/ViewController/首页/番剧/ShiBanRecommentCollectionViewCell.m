//
//  ShiBanRecommentCollectionViewCell.m
//  BiliBili
//
//  Created by JimHuang on 16/1/14.
//  Copyright © 2016年 JimHuang. All rights reserved.
//

#import "ShiBanRecommentCollectionViewCell.h"

@implementation ShiBanRecommentCollectionViewCell
- (void)setUpProperty{
    self.titleLabel.backgroundColor = [[ColorManager shareColorManager] colorWithString: @"lightBackGroundColor"];
    self.titleLabel.textColor = [[ColorManager shareColorManager] colorWithString:@"textColor"];
}

- (UIImageView *)imgView {
    if(_imgView == nil) {
        _imgView = [[UIImageView alloc] init];
        [self.contentView addSubview: _imgView];
        [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.bottom.mas_equalTo(self.titleLabel.mas_top);
        }];
    }
    return _imgView;
}

- (UILabel *)titleLabel {
    if(_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize: 11];
        _titleLabel.numberOfLines = 2;
        [self.contentView addSubview: _titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.mas_equalTo(0);
            make.height.mas_equalTo(29);
        }];
    }
    return _titleLabel;
}

@end
