//
//  ShiBanHeadHeaderFooterView.m
//  BiliBili
//
//  Created by JimHuang on 16/8/1.
//  Copyright © 2016年 JimHuang. All rights reserved.
//

#import "ShiBanHeadHeaderFooterView.h"
@implementation ShiBanHeadHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_offset(10);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).mas_offset(10);
            make.centerY.equalTo(self.iconImageView);
        }];
    }
    return self;
}

#pragma mark - ChangeThemeProtocol
- (void)changeTheme {
    self.titleLabel.textColor = [[ColorManager shareColorManager] colorWithString:@"textColor"];
}

#pragma mark - 懒加载
- (UIImageView *)iconImageView {
    if(_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconImageView];
    }
    return _iconImageView;
}

- (UILabel *)titleLabel {
    if(_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}
@end
