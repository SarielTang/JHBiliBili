//
//  ShiBanHeadHeaderFooterView.h
//  BiliBili
//
//  Created by JimHuang on 16/8/1.
//  Copyright © 2016年 JimHuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangeThemeProtocol.h"
/**
 *  番剧的分区头
 */
@interface ShiBanHeadHeaderFooterView : UITableViewHeaderFooterView<ChangeThemeProtocol>
@property (strong, nonatomic) UIImageView *iconImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@end
