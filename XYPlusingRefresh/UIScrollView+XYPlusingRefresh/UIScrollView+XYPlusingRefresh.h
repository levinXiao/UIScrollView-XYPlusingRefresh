//
//  UIScrollView+XYPlusingRefresh.h
//  XYPlusingRefresh
//
//  Created by xiaoyu on 16/5/20.
//  Copyright © 2016年 xiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (XYPlusingRefresh)


@property (nonatomic,copy) void(^downRefreshBlock)(id refreshView);


#pragma mark --下拉刷新构造函数
-(void)initDownRefreshCompletion:(void((^)(id refreshView)))completion;

-(void)endDownRefresh;

-(void)autoRefresh;

#pragma mark -
#pragma mark 下拉刷新变量
//下拉刷新相关
@property (nonatomic,strong) UIView *pulsingView_down;
@property (nonatomic,strong) UILabel *pulsingLabel_down;

@property (nonatomic) BOOL isDownRefreshInit;
@property (nonatomic) BOOL isDownRefreshing;
@property (nonatomic) BOOL isPrepareAnimationAdded_down;
@property (nonatomic) BOOL prepareToRefresh_down;

@property (nonatomic,strong) CABasicAnimation *down_prepareScaleAnimation;

@property (nonatomic,strong) CAAnimationGroup *down_refreshingAnimationGroup;

#pragma mark - 上拉刷新

@property (nonatomic,copy) void(^pullupRefreshBlock)(id refreshView);

//自动进行上拉刷新的高度 当滑动scrollview到 距离底部 距离$autoTrigglePullUpHeight 的高度时候 自动进行刷新 默认值为150
//也就是说 如果这时候我scrollview的高度是1000 分为100格 当我滑动到刚出现 85格的时候 这时候就自动触发了刷新操作
@property (nonatomic,assign) float autoTrigglePullUpHeight;

@property (nonatomic,assign) BOOL noMoreDataToPullUpRefresh;

-(void)initPullUpRefreshCompletion:(void (^)(id refreshView))completion;
-(void)initPullUpRefresh;
#pragma mark --上拉刷新结束函数
-(void)endPullUpRefresh;

#pragma mark 默认上拉刷新样式为自动上拉刷新 即tableview滑动到接近底部的时候自动刷新

@property (nonatomic,strong) UIView *pulsingView_pull;
//@property (nonatomic,strong) UILabel *pulsingNoMoreLabel_pull;

@property (nonatomic) BOOL isPullUpRefreshing;
@property (nonatomic) BOOL isPullUpRefreshInit;

@property (nonatomic,strong) CAAnimationGroup *pull_refreshingAnimationGroup;

@end

@interface CALayer (XYPlusingRefresh_PauseResume)

-(void)XYPlusingRefresh_pause;

-(void)XYPlusingRefresh_resume;

-(void)XYPlusingRefresh_reset;

@end