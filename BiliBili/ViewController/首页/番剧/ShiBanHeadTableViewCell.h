//
//  ShiBanHeadTableViewCell.h
//  BiliBili
//
//  Created by JimHuang on 16/8/1.
//  Copyright © 2016年 JimHuang. All rights reserved.
//

#import "BaseTableViewCell.h"
/**
 *  新番头部的按钮
 */
@interface ShiBanHeadTableViewCell : BaseTableViewCell
@property (copy, nonatomic) void(^touchButtonCallBack)(NSUInteger tag);
@end
