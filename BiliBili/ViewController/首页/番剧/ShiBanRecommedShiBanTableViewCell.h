//
//  ShiBanRecommedShiBanTableViewCell.h
//  BiliBili
//
//  Created by JimHuang on 16/8/1.
//  Copyright © 2016年 JimHuang. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "ShinBanModel.h"

/**
 *  推荐番剧cell
 */

@interface ShiBanRecommedShiBanTableViewCell : BaseTableViewCell
- (CGFloat)cellHeightWithModels:(NSArray *)models;
@property (copy, nonatomic) void(^touchItemCallBack)(RecommentShinBanDataModel *);
@end
