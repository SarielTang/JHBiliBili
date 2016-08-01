//
//  ShiBanHeadTableViewCell.m
//  BiliBili
//
//  Created by JimHuang on 16/8/1.
//  Copyright © 2016年 JimHuang. All rights reserved.
//

#import "ShiBanHeadTableViewCell.h"
@interface ShiBanHeadTableViewCell ()
@property (strong, nonatomic) UIButton *everyDayPlayButton;
@property (strong, nonatomic) UIButton *shiBanIndexButton;
@end

@implementation ShiBanHeadTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.everyDayPlayButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_offset(10);
            make.size.equalTo(self.shiBanIndexButton);
        }];
        
        [self.shiBanIndexButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.everyDayPlayButton.mas_right).mas_offset(10);
            make.right.mas_offset(-10);
            make.centerY.equalTo(self.everyDayPlayButton);
        }];
    }
    return self;
}

- (void)changeTheme {
    self.contentView.backgroundColor = [[ColorManager shareColorManager] colorWithString:@"backgroundColor"];
}

#pragma mark - 私有方法
- (void)_touchButton:(UIButton *)button {
    if (self.touchButtonCallBack) {
        self.touchButtonCallBack(button.tag);
    }
}

#pragma mark - 懒加载
- (UIButton *)everyDayPlayButton {
	if(_everyDayPlayButton == nil) {
		_everyDayPlayButton = [[UIButton alloc] init];
        _everyDayPlayButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        _everyDayPlayButton.tag = 100;
        [_everyDayPlayButton setImage:[UIImage imageNamed:@"home_bangumi_category"] forState:UIControlStateNormal];
        [_everyDayPlayButton addTarget:self action:@selector(_touchButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_everyDayPlayButton];
	}
	return _everyDayPlayButton;
}

- (UIButton *)shiBanIndexButton {
	if(_shiBanIndexButton == nil) {
		_shiBanIndexButton = [[UIButton alloc] init];
        _shiBanIndexButton.tag = 101;
        _shiBanIndexButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_shiBanIndexButton setImage:[UIImage imageNamed:@"home_bangumi_timeline"] forState:UIControlStateNormal];
        [_shiBanIndexButton addTarget:self action:@selector(_touchButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_shiBanIndexButton];
	}
	return _shiBanIndexButton;
}

@end
