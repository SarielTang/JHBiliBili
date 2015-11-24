//
//  ShinBanModel.h
//  BiliBili
//
//  Created by apple-jd44 on 15/10/28.
//  Copyright © 2015年 JimHuang. All rights reserved.
//

#import "BaseModel.h"
/**
 *  番剧页模型
 *
 */

//大家都在看
@interface MoreViewShinBanModel : BaseModel
@property (nonatomic, strong)NSArray* list;
@end
//推荐番剧
@interface RecommentShinBanModel : BaseModel
@property (nonatomic, strong)NSArray* list;
@end

@interface RecommentShinBanDataModel : BaseModel
//@property (nonatomic, strong)NSNumber* is_finish;
//@property (nonatomic, strong)NSNumber* pub_time;
//@property (nonatomic, strong)NSString* week;
//@property (nonatomic, strong)NSString* newest_ep_index;
//@property (nonatomic, strong)NSNumber* total_count;
//@property (nonatomic, strong)NSString* url;
@property (nonatomic, strong)NSString* title;
@property (nonatomic, strong)NSString* season_id;
@property (nonatomic, strong)NSString* cover;
@end


@interface MoreViewShinBanDataModel : BaseModel
//@property (nonatomic, strong)NSNumber* mid;
//@property (nonatomic, strong)NSString* subtitle;
//@property (nonatomic, strong)NSNumber* credit;
//@property (nonatomic, strong)NSString* pubdate;
//@property (nonatomic, strong)NSNumber* typeID;
//简介
@property (nonatomic, strong)NSString* desc;
//播放数
@property (nonatomic, assign)NSInteger play;
//评论
@property (nonatomic, strong)NSNumber* review;
//收藏
@property (nonatomic, strong)NSNumber* favorites;
//作者
@property (nonatomic, strong)NSString* author;
//硬币
@property (nonatomic, strong)NSNumber* coins;
//图片
@property (nonatomic, strong)NSString* pic;
//标题
@property (nonatomic, strong)NSString* title;
//弹幕
@property (nonatomic, strong)NSNumber* video_review;
//时长
@property (nonatomic, strong)NSString* duration;
//创建时间
@property (nonatomic, strong)NSString* create;
//av号
@property (nonatomic, strong)NSNumber* aid;
@end