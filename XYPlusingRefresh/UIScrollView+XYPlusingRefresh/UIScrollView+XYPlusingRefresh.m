//
//  UIScrollView+XYPlusingRefresh.m
//  XYPlusingRefresh
//
//  Created by xiaoyu on 16/5/20.
//  Copyright © 2016年 xiaoyu. All rights reserved.
//

#import "UIScrollView+XYPlusingRefresh.h"
#import <objc/runtime.h>


#define PulsingViewColor [UIColor colorWithRed:26/255.f green:161/255.f blue:230/255.f alpha:1]
#define PulsingLabelColor [UIColor colorWithRed:106/255.f green:123/255.f blue:137/255.f alpha:1]

@implementation UIScrollView (XYPlusingRefresh)

static float refreshActiveHeight_down = 87.5;

static float refreshViewContainerViewHeight_down = 40;
static float refreshViewHeight_down = 16;

static float refreshLabelWideh_down = 100;

static float refreshViewContainerViewHeight_pull = 40;
static float refreshViewHeight_pull = 16;

static float autoTrigglePullUpHeight_Default = 150;



#pragma mark ————————————————————————————————
#pragma mark 上拉刷新
#pragma mark ————————————————————————————————
#pragma mark 设置变量
@dynamic isDownRefreshInit,isDownRefreshing,prepareToRefresh_down;
-(BOOL)isDownRefreshInit{
    id i = objc_getAssociatedObject(self, @selector(isDownRefreshInit));
    if (i) {
        return [i boolValue];
    }
    return NO;
}
-(void)setIsDownRefreshInit:(BOOL)params{
    objc_setAssociatedObject(self, @selector(isDownRefreshInit),@(params), OBJC_ASSOCIATION_ASSIGN);
}
-(BOOL)isDownRefreshing{
    id i = objc_getAssociatedObject(self, @selector(isDownRefreshing));
    if (i) {
        return [i boolValue];
    }
    return NO;
}
-(void)setIsDownRefreshing:(BOOL)params{
    objc_setAssociatedObject(self, @selector(isDownRefreshing),@(params), OBJC_ASSOCIATION_ASSIGN);
}
@dynamic isPrepareAnimationAdded_down;
-(BOOL)isPrepareAnimationAdded_down{
    id i = objc_getAssociatedObject(self, @selector(isPrepareAnimationAdded_down));
    if (i) {
        return [i boolValue];
    }
    return NO;
}
- (void)setIsPrepareAnimationAdded_down:(BOOL)params{
    objc_setAssociatedObject(self, @selector(isPrepareAnimationAdded_down),@(params), OBJC_ASSOCIATION_ASSIGN);
}
-(BOOL)prepareToRefresh_down{
    id i = objc_getAssociatedObject(self, @selector(prepareToRefresh_down));
    if (i) {
        return [i boolValue];
    }
    return NO;
}
- (void)setPrepareToRefresh_down:(BOOL)params{
    objc_setAssociatedObject(self, @selector(prepareToRefresh_down),@(params), OBJC_ASSOCIATION_ASSIGN);
}

@dynamic pulsingView_down;
-(UIView *)pulsingView_down{
    id i = objc_getAssociatedObject(self, @selector(pulsingView_down));
    if (i) {
        return (UIView *)i;
    }
    return nil;
}
- (void)setPulsingView_down:(UIView *)params{
    objc_setAssociatedObject(self, @selector(pulsingView_down),params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@dynamic pulsingLabel_down;
-(UILabel *)pulsingLabel_down{
    id i = objc_getAssociatedObject(self, @selector(pulsingLabel_down));
    if (i) {
        return (UILabel *)i;
    }
    return nil;
}
- (void)setPulsingLabel_down:(UILabel *)params{
    objc_setAssociatedObject(self, @selector(pulsingLabel_down),params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@dynamic down_prepareScaleAnimation;
-(CABasicAnimation *)down_prepareScaleAnimation{
    id i = objc_getAssociatedObject(self, @selector(down_prepareScaleAnimation));
    if (i) {
        return (CABasicAnimation *)i;
    }
    return nil;
}
- (void)setDown_prepareScaleAnimation:(CABasicAnimation *)params{
    objc_setAssociatedObject(self, @selector(down_prepareScaleAnimation),params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@dynamic down_refreshingAnimationGroup;
-(CAAnimationGroup *)down_refreshingAnimationGroup{
    id i = objc_getAssociatedObject(self, @selector(down_refreshingAnimationGroup));
    if (i) {
        return (CAAnimationGroup *)i;
    }
    return nil;
}
- (void)setDown_refreshingAnimationGroup:(CAAnimationGroup *)params{
    objc_setAssociatedObject(self, @selector(down_refreshingAnimationGroup),params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@dynamic downRefreshBlock;
-(void((^)(id refreshView)))downRefreshBlock{
    id i = objc_getAssociatedObject(self, @selector(downRefreshBlock));
    if (i) {
        return (void((^)(id refreshView)))i;
    }
    return nil;
}
- (void)setDownRefreshBlock:(void((^)(id refreshView)))params{
    objc_setAssociatedObject(self, @selector(downRefreshBlock),params, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


#pragma mark -
#pragma mark - 上拉刷新构造变量
@dynamic pulsingView_pull;
-(UIView *)pulsingView_pull{
    id i = objc_getAssociatedObject(self, @selector(pulsingView_pull));
    if (i) {
        return (UIView *)i;
    }
    return nil;
}
- (void)setPulsingView_pull:(UIView *)params{
    objc_setAssociatedObject(self, @selector(pulsingView_pull),params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//@dynamic pulsingLabel_pull;
//-(UILabel *)pulsingLabel_pull{
//    id i = objc_getAssociatedObject(self, @selector(pulsingLabel_pull));
//    if (i) {
//        return (UILabel *)i;
//    }
//    return nil;
//}
//- (void)setPulsingLabel_pull:(UILabel *)params{
//    objc_setAssociatedObject(self, @selector(pulsingLabel_pull),params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}

@dynamic pull_refreshingAnimationGroup;
-(CAAnimationGroup *)pull_refreshingAnimationGroup{
    id i = objc_getAssociatedObject(self, @selector(pull_refreshingAnimationGroup));
    if (i) {
        return (CAAnimationGroup *)i;
    }
    return nil;
}
- (void)setPull_refreshingAnimationGroup:(CAAnimationGroup *)params{
    objc_setAssociatedObject(self, @selector(pull_refreshingAnimationGroup),params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@dynamic isPullUpRefreshInit,isPullUpRefreshing;
-(BOOL)isPullUpRefreshInit{
    id i = objc_getAssociatedObject(self, @selector(isPullUpRefreshInit));
    if (i) {
        return [i boolValue];
    }
    return NO;
}
-(void)setIsPullUpRefreshInit:(BOOL)params{
    objc_setAssociatedObject(self, @selector(isPullUpRefreshInit),@(params), OBJC_ASSOCIATION_ASSIGN);
}

-(BOOL)isPullUpRefreshing{
    id i = objc_getAssociatedObject(self, @selector(isPullUpRefreshing));
    if (i) {
        return [i boolValue];
    }
    return NO;
}
-(void)setIsPullUpRefreshing:(BOOL)params{
    objc_setAssociatedObject(self, @selector(isPullUpRefreshing),@(params), OBJC_ASSOCIATION_ASSIGN);
}

@dynamic autoTrigglePullUpHeight;
-(float)autoTrigglePullUpHeight{
    id i = objc_getAssociatedObject(self, @selector(autoTrigglePullUpHeight));
    if (i) {
        return [i floatValue];
    }
    return NO;
}

-(void)setAutoTrigglePullUpHeight:(float)params{
    objc_setAssociatedObject(self, @selector(autoTrigglePullUpHeight),@(params), OBJC_ASSOCIATION_ASSIGN);
}

@dynamic noMoreDataToPullUpRefresh;
-(BOOL)noMoreDataToPullUpRefresh{
    id i = objc_getAssociatedObject(self, @selector(noMoreDataToPullUpRefresh));
    if (i) {
        return [i floatValue];
    }
    return NO;
}

-(void)setNoMoreDataToPullUpRefresh:(BOOL)params{
    objc_setAssociatedObject(self, @selector(noMoreDataToPullUpRefresh),@(params), OBJC_ASSOCIATION_ASSIGN);
}


@dynamic pullupRefreshBlock;
-(void((^)(id refreshView)))pullupRefreshBlock{
    id i = objc_getAssociatedObject(self, @selector(pullupRefreshBlock));
    if (i) {
        return (void((^)(id refreshView)))i;
    }
    return nil;
}
- (void)setPullupRefreshBlock:(void((^)(id refreshView)))params{
    objc_setAssociatedObject(self, @selector(pullupRefreshBlock),params, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


#pragma mark -
#pragma mark -- 下拉刷新构造函数
-(void)initDownRefreshCompletion:(void((^)(id refreshView)))completion{
    self.downRefreshBlock = completion;
    [self initDownRefresh];
}

-(void)initDownRefresh{
    self.isDownRefreshInit = YES;
    self.isDownRefreshing = NO;
    [self initDownRefreshBubbleView];
    [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:NULL];
}

#pragma mark -
-(void)initDownRefreshBubbleView{
    [self.pulsingView_down.layer removeAllAnimations];
    
    [self.pulsingView_down removeFromSuperview];
    [self.pulsingLabel_down removeFromSuperview];
    
    self.pulsingView_down = [[UIView alloc] init];
    self.pulsingView_down.frame = (CGRect){
        (int)((self.frame.size.width-refreshViewHeight_down-refreshLabelWideh_down)/2)+20,
        -refreshActiveHeight_down,
        refreshViewHeight_down,
        refreshViewHeight_down
    };
    self.pulsingView_down.alpha = 1.f;
    self.pulsingView_down.layer.cornerRadius = refreshViewHeight_down/2;
    self.pulsingView_down.backgroundColor = PulsingViewColor;
    [self addSubview:self.pulsingView_down];
    
    self.pulsingLabel_down = [[UILabel alloc] init];
    self.pulsingLabel_down.textColor = PulsingLabelColor;
    self.pulsingLabel_down.textAlignment = NSTextAlignmentCenter;
    self.pulsingLabel_down.font = [UIFont systemFontOfSize:14];
    self.pulsingLabel_down.frame = (CGRect){
        self.pulsingView_down.frame.origin.x+refreshViewHeight_down,
        -refreshActiveHeight_down,
        refreshLabelWideh_down,
        refreshViewHeight_down
    };
    self.pulsingLabel_down.text = @"下拉刷新";
    [self addSubview:self.pulsingLabel_down];
    
    [self initDownPulsingLayer];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(initDownPulsingLayer) name:UIApplicationDidBecomeActiveNotification object:nil];
}

-(void)initDownPulsingLayer{
    if (!self.isDownRefreshInit) {
        return;
    }
    [self.pulsingView_down.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    
    for (int i = 0; i < 3; i++) {
        CALayer *pulsingLayer = [CALayer layer];
        pulsingLayer.frame = self.pulsingView_down.layer.bounds;
        pulsingLayer.backgroundColor = self.pulsingView_down.backgroundColor.CGColor;
        pulsingLayer.cornerRadius = pulsingLayer.bounds.size.width/2;
        pulsingLayer.masksToBounds = YES;
        [self.pulsingView_down.layer addSublayer:pulsingLayer];
        
        CAAnimationGroup *group = [self downRefreshingBaseAnimationWithBetweenOffset:i*0.7];
        [pulsingLayer addAnimation:group forKey:@"UIScrollView_XYPlusingRefresh_down_layer_pulsing"];
        group.delegate = self;
        
        [group setValue:@"pulsingLayerGroupAnimation" forKey:@"UIScrollView_DownRefresh_XYPlusingRefresh_ValueKey"];
        
        if (self.isDownRefreshing) {
            [pulsingLayer XYPlusingRefresh_resume];
        }else{
            [pulsingLayer XYPlusingRefresh_pause];
        }
    }
}

-(CABasicAnimation *)downPrepareScaleAnimation{
    if (!self.down_prepareScaleAnimation) {
        self.down_prepareScaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        self.down_prepareScaleAnimation.fromValue = @1;
        self.down_prepareScaleAnimation.toValue = @1.2;
        self.down_prepareScaleAnimation.duration = 0.3f;
        self.down_prepareScaleAnimation.delegate = self;
        self.down_prepareScaleAnimation.autoreverses = YES;
        self.down_prepareScaleAnimation.repeatCount = 1;
        self.down_prepareScaleAnimation.fillMode = kCAFillModeForwards;
        self.down_prepareScaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [self.down_prepareScaleAnimation setValue:@"prepareScaleAnimation" forKey:@"UIScrollView_DownRefresh_XYPlusingRefresh_ValueKey"];
        self.down_prepareScaleAnimation.removedOnCompletion = YES;
    }
    return self.down_prepareScaleAnimation;
}

-(CAAnimationGroup *)downRefreshingBaseAnimationWithBetweenOffset:(float)offset{
    float animationDuration = 2.f;
    if (self.down_refreshingAnimationGroup) {
        self.down_refreshingAnimationGroup.beginTime = offset + animationDuration;
        return self.down_refreshingAnimationGroup;
    }
    CAAnimationGroup *baseAnimationGroup = [[CAAnimationGroup alloc] init];
    
    CAMediaTimingFunction *defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    baseAnimationGroup.fillMode = kCAFillModeBoth;
    baseAnimationGroup.beginTime = offset + animationDuration;
    baseAnimationGroup.duration = animationDuration;
    baseAnimationGroup.repeatCount = HUGE_VAL;
    baseAnimationGroup.timingFunction = defaultCurve;
    
    CABasicAnimation * scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.autoreverses = NO;
    scaleAnimation.fromValue = [NSNumber numberWithDouble:1.0];
    scaleAnimation.toValue = [NSNumber numberWithDouble:3.0];
    
    
    CAKeyframeAnimation * opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.values = @[[NSNumber numberWithDouble:0.5],[NSNumber numberWithDouble:0.3],[NSNumber numberWithDouble:0.1],[NSNumber numberWithDouble:0.0]];
    opacityAnimation.keyTimes = @[[NSNumber numberWithDouble:0.0],[NSNumber numberWithDouble:0.25],[NSNumber numberWithDouble:0.5],[NSNumber numberWithDouble:1.0]];
    baseAnimationGroup.animations = @[scaleAnimation,opacityAnimation];
    
    self.down_refreshingAnimationGroup = baseAnimationGroup;
    
    return self.down_refreshingAnimationGroup;
}

-(void)downRefreshing{
    if (self.isDownRefreshing || self.isPullUpRefreshing) {
        return;
    }
    self.isDownRefreshing = YES;
    self.pulsingLabel_down.text = @"正在刷新";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.isPullUpRefreshing) {
            self.isDownRefreshing = NO;
            return;
        }
        if (self.downRefreshBlock) {
            self.downRefreshBlock(self);
        }
    });
}

-(void)endDownRefresh{
    if (!self.isDownRefreshing) {
        return;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.4f animations:^{
            self.contentInset = UIEdgeInsetsZero;
        }completion:^(BOOL finished) {
            for (CALayer *layer in self.pulsingView_down.layer.sublayers) {
                [layer XYPlusingRefresh_reset];
                [layer XYPlusingRefresh_pause];
            }
            self.isPrepareAnimationAdded_down = NO;
            self.prepareToRefresh_down = NO;
            self.isDownRefreshing = NO;
            self.pulsingLabel_down.text = @"下拉刷新";
        }];
    });
}

-(void)autoRefresh{
    if (!self.isDownRefreshInit) {
        return;
    }
    
    [UIView animateWithDuration:0.3f animations:^{
        self.contentOffset = (CGPoint){0,-refreshViewContainerViewHeight_down};
        self.contentInset = UIEdgeInsetsMake(refreshViewContainerViewHeight_down, 0, 0, 0);
        self.pulsingView_down.frame = (CGRect){
            (int)((self.frame.size.width-refreshViewHeight_down-refreshLabelWideh_down)/2)+20,
            (int)(-(refreshViewContainerViewHeight_down-refreshViewHeight_down)/2-refreshViewHeight_down),
            refreshViewHeight_down,
            refreshViewHeight_down
        };
        self.pulsingLabel_down.frame = (CGRect){
            (int)(self.pulsingView_down.frame.origin.x + refreshViewHeight_down),
            (int)(-(refreshViewContainerViewHeight_down-refreshViewHeight_down)/2-refreshViewHeight_down),
            refreshLabelWideh_down,
            refreshViewHeight_down
        };
    }];
    for (CALayer *layer in self.pulsingView_down.layer.sublayers) {
        [layer XYPlusingRefresh_reset];
        [layer XYPlusingRefresh_resume];
    }
    
    [self downRefreshing];
}


#pragma mark -
#pragma mark --上拉刷新构造函数
-(void)initPullUpRefreshCompletion:(void (^)(id refreshView))completion{
    self.pullupRefreshBlock = completion;
    [self initPullUpRefresh];
}

-(void)initPullUpRefresh{
    self.isPullUpRefreshInit = YES;
    self.isPullUpRefreshing = NO;
    [self initPullUpRefreshPulsingView];
    [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:NULL];
}

-(void)initPullUpRefreshPulsingView{
    [self.pulsingView_pull.layer removeAllAnimations];
    
    [self.pulsingView_pull removeFromSuperview];
    //    [self.pulsingLabel_pull removeFromSuperview];
    
    self.pulsingView_pull = [[UIView alloc] init];
    self.pulsingView_pull.frame = (CGRect){
        (int)(self.frame.size.width-refreshViewHeight_pull)/2,
        self.contentSize.height+(refreshViewContainerViewHeight_pull - refreshViewHeight_pull)/2,
        refreshViewHeight_pull,
        refreshViewHeight_pull
    };
    self.pulsingView_pull.alpha = 1.f;
    self.pulsingView_pull.layer.cornerRadius = refreshViewHeight_down/2;
    self.pulsingView_pull.backgroundColor = PulsingViewColor;
    //fix bug 不应该在这里就将 pulsingView_pull 添加到视图上 这样就不会出现如果scrollview中的contentSize<frame.size.height的时候 视图默认出现的问题了 可以在滑动的时候动态检测是否存在
    //    [self addSubview:self.pulsingView_pull];
    
    [self initPullPulsingLayer];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(initPullPulsingLayer) name:UIApplicationDidBecomeActiveNotification object:nil];
}

-(void)initPullPulsingLayer{
    if (!self.isPullUpRefreshInit) {
        return;
    }
    [self.pulsingView_pull.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    
    for (int i = 0; i < 3; i++) {
        CALayer *pulsingLayer = [CALayer layer];
        pulsingLayer.frame = self.pulsingView_pull.layer.bounds;
        pulsingLayer.backgroundColor = self.pulsingView_pull.backgroundColor.CGColor;
        pulsingLayer.cornerRadius = pulsingLayer.bounds.size.width/2;
        pulsingLayer.masksToBounds = YES;
        [self.pulsingView_pull.layer addSublayer:pulsingLayer];
        
        CAAnimationGroup *group = [self pullRefreshingBaseAnimationWithBetweenOffset:i*0.7];
        [pulsingLayer addAnimation:group forKey:@"UIScrollView_XYPlusingRefresh_pull_layer_pulsing"];
        group.delegate = self;
        
        [group setValue:@"pulsingLayerGroupAnimation" forKey:@"UIScrollView_PullRefresh_XYPlusingRefresh_ValueKey"];
        
        if (self.isPullUpRefreshing) {
            [pulsingLayer XYPlusingRefresh_resume];
        }else{
            [pulsingLayer XYPlusingRefresh_pause];
        }
    }
}

-(CAAnimationGroup *)pullRefreshingBaseAnimationWithBetweenOffset:(float)offset{
    float animationDuration = 2.f;
    //    if (self.pull_refreshingAnimationGroup) {
    //        self.pull_refreshingAnimationGroup.beginTime = offset + animationDuration;
    //        return self.pull_refreshingAnimationGroup;
    //    }
    CAAnimationGroup *baseAnimationGroup = [[CAAnimationGroup alloc] init];
    
    CAMediaTimingFunction *defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    baseAnimationGroup.fillMode = kCAFillModeBoth;
    baseAnimationGroup.beginTime = offset + animationDuration;
    baseAnimationGroup.duration = animationDuration;
    baseAnimationGroup.repeatCount = HUGE_VAL;
    baseAnimationGroup.timingFunction = defaultCurve;
    
    CABasicAnimation * scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.autoreverses = NO;
    scaleAnimation.fromValue = [NSNumber numberWithDouble:1.0];
    scaleAnimation.toValue = [NSNumber numberWithDouble:3.0];
    
    
    CAKeyframeAnimation * opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.values = @[[NSNumber numberWithDouble:0.5],[NSNumber numberWithDouble:0.3],[NSNumber numberWithDouble:0.1],[NSNumber numberWithDouble:0.0]];
    opacityAnimation.keyTimes = @[[NSNumber numberWithDouble:0.0],[NSNumber numberWithDouble:0.25],[NSNumber numberWithDouble:0.5],[NSNumber numberWithDouble:1.0]];
    baseAnimationGroup.animations = @[scaleAnimation,opacityAnimation];
    
    self.pull_refreshingAnimationGroup = baseAnimationGroup;
    
    return self.pull_refreshingAnimationGroup;
}

#pragma mark --上拉刷新开始函数
-(void)pullBeginPullRefreshTransformAnimation{
    if (self.isPullUpRefreshing || self.isDownRefreshing) {
        return;
    }
    self.isPullUpRefreshing = YES;
    for (int i = 0; i < self.pulsingView_pull.layer.sublayers.count; i++) {
        CALayer *layer = (CALayer *)self.pulsingView_pull.layer.sublayers[i];
        CAAnimation *layerAnimation = [layer animationForKey:@"UIScrollView_XYPlusingRefresh_pull_layer_pulsing"];
        if (layerAnimation) {
            [layer XYPlusingRefresh_resume];
        }else{
            CAAnimationGroup *group = [self pullRefreshingBaseAnimationWithBetweenOffset:i*0.7];
            [layer addAnimation:group forKey:@"UIScrollView_XYPlusingRefresh_pull_layer_pulsing"];
            group.delegate = self;
            
            [group setValue:@"pulsingLayerGroupAnimation" forKey:@"UIScrollView_PullRefresh_XYPlusingRefresh_ValueKey"];
            
            [layer XYPlusingRefresh_resume];
        }
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.isDownRefreshing) {
            self.isPullUpRefreshing = NO;
            return;
        }
        if (self.pullupRefreshBlock) {
            self.pullupRefreshBlock(self);
        }
    });
}

#pragma mark --上拉刷新结束函数
-(void)endPullUpRefresh{
    if (!self.isPullUpRefreshing) {
        return;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.4f animations:^{
            self.contentInset = UIEdgeInsetsZero;
        }completion:^(BOOL finished) {
            for (CALayer *layer in self.pulsingView_pull.layer.sublayers) {
                [layer XYPlusingRefresh_reset];
                [layer XYPlusingRefresh_pause];
            }
            self.isPullUpRefreshing = NO;
            [self backToNormalPullUpState];
        }];
    });
}

-(void)backToNormalPullUpState{
    self.contentInset = UIEdgeInsetsZero;
    self.isPullUpRefreshing = NO;
    self.pulsingView_pull.alpha = 0.f;
    [self.pulsingView_pull removeFromSuperview];
}

#pragma mark ————————————————————————————————
#pragma mark 核心函数  动画结束代理
#pragma mark ————————————————————————————————
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (flag) {
        //down refresh animation stop
        //下拉刷新动画结束的事件
        NSString *downanimKey = [anim valueForKey:@"UIScrollView_DownRefresh_XYPlusingRefresh_ValueKey"];
        if (downanimKey && [downanimKey isKindOfClass:[NSString class]]) {
            if ([downanimKey isEqualToString:@"prepareScaleAnimation"]) {
                self.prepareToRefresh_down = YES;
                for (CALayer *layer in self.pulsingView_down.layer.sublayers) {
                    [layer XYPlusingRefresh_reset];
                    [layer XYPlusingRefresh_resume];
                }
            }else if ([downanimKey isEqualToString:@"pulsingLayerGroupAnimation"]){
                NSLog(@"finish");
            }
        }
    }
}

#pragma mark ————————————————————————————————
#pragma mark 核心函数  KVO代理
#pragma mark ————————————————————————————————
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    if(object != self || ![keyPath isEqualToString:@"contentOffset"]){
        return;
    }
    NSValue *contentOffsetValue = change[NSKeyValueChangeNewKey];
    CGPoint point;
    [contentOffsetValue getValue:&point];
    if (point.y < 0) {
        if (self.isPullUpRefreshing) {
            return;
        }
        if (self.isDownRefreshInit) {
            if (self.isDownRefreshing) {
                return;
            }
            float maxMove = (refreshActiveHeight_down - refreshViewContainerViewHeight_down) + (refreshViewContainerViewHeight_down -refreshViewHeight_down)/2;
            float offsetMove = MIN(maxMove, fabs(point.y));
            if (self.contentInset.top != refreshViewContainerViewHeight_down) {
                self.pulsingView_down.frame = (CGRect){
                    (int)((self.frame.size.width-refreshViewHeight_down-refreshLabelWideh_down)/2+20),
                    (int)(-refreshActiveHeight_down + offsetMove),
                    refreshViewHeight_down,
                    refreshViewHeight_down
                };
                self.pulsingLabel_down.frame = (CGRect){
                    (int)(self.pulsingView_down.frame.origin.x+refreshViewHeight_down),
                    (int)(-refreshActiveHeight_down + offsetMove),
                    refreshLabelWideh_down,
                    refreshViewHeight_down
                };
                if(self.isDecelerating && -point.y > refreshActiveHeight_down){
                    [UIView animateWithDuration:0.3f animations:^{
                        self.contentInset = UIEdgeInsetsMake(refreshViewContainerViewHeight_down, 0, 0, 0);
                    }];
                    [self downRefreshing];
                    return;
                }
            }
            if (offsetMove == maxMove) {
                if(!self.isPrepareAnimationAdded_down && !self.isDownRefreshing){
                    self.isPrepareAnimationAdded_down = YES;
                    self.prepareToRefresh_down = NO;
                    self.pulsingLabel_down.text = @"松开刷新";
                    [self.pulsingView_down.layer addAnimation:[self downPrepareScaleAnimation] forKey:@"UIScrollView_XYPlusingRefresh_down_pulsingView_down_prepareScale"];
                }
            }
            if (self.isDecelerating){
                if(self.prepareToRefresh_down) {
                    //当contentInset 设置为30的时候 正准备开始刷新的时候 会立刻发送一次contentoffset为-30 这里要过滤这个值
                    if (fabs(point.y) < refreshViewContainerViewHeight_down + 5 &&
                        fabs(point.y) != refreshViewContainerViewHeight_down) {
                        self.isPrepareAnimationAdded_down = NO;
                        self.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
                        self.prepareToRefresh_down = NO;
                        self.isDownRefreshing = NO;
                        self.pulsingLabel_down.text = @"下拉刷新";
                        for (CALayer *layer in self.pulsingView_down.layer.sublayers) {
                            [layer XYPlusingRefresh_reset];
                            [layer XYPlusingRefresh_pause];
                        }
                    }else{
                        [UIView animateWithDuration:0.3f animations:^{
                            self.contentInset = UIEdgeInsetsMake(refreshViewContainerViewHeight_down, 0, 0, 0);
                        }];
                        [self downRefreshing];
                    }
                }
            }
            if (self.isPrepareAnimationAdded_down && offsetMove < maxMove && ![self.pulsingView_down.layer animationForKey:@"UIScrollView_XYPlusingRefresh_down_pulsingView_down_prepareScale"]) {
                self.isPrepareAnimationAdded_down = NO;
            }
        }
    }else{
        if (self.isDownRefreshing) {
            return;
        }
        if (!self.isPullUpRefreshInit) {
            return;
        }
        if (self.isPullUpRefreshing) {
            return;
        }
        CGFloat moveCompareOffsetY = point.y + self.bounds.size.height - self.contentSize.height;
        NSLog(@"pointY:%f moveCompareOffsetY %f",point.y,moveCompareOffsetY);
        if (moveCompareOffsetY < -(self.autoTrigglePullUpHeight == 0 ? autoTrigglePullUpHeight_Default : self.autoTrigglePullUpHeight)) {
            [self backToNormalPullUpState];
            return;
        }
        if (self.contentSize.height < self.bounds.size.height) {
            if (self.pulsingView_pull.alpha != 0) {
                [self backToNormalPullUpState];
            }
            return;
        }else{
            if (self.noMoreDataToPullUpRefresh) {
                [self backToNormalPullUpState];
                return;
            }
            if (![self.subviews containsObject:self.pulsingView_pull]) {
                self.isPullUpRefreshing = NO;
                self.pulsingView_pull.alpha = 1.f;
                self.pulsingView_pull.frame = (CGRect){
                    (int)(self.frame.size.width-refreshViewHeight_pull)/2,
                    self.contentSize.height+(refreshViewContainerViewHeight_pull - refreshViewHeight_pull)/2,
                    refreshViewHeight_pull,
                    refreshViewHeight_pull
                };
                [self addSubview:self.pulsingView_pull];
            }
        }
        if (self.noMoreDataToPullUpRefresh) {
            [self backToNormalPullUpState];
            return;
        }
        NSLog(@"pullrefresh start");
        [UIView animateWithDuration:0.3f animations:^{
            self.contentInset = UIEdgeInsetsMake(0, 0, refreshViewContainerViewHeight_pull, 0);
        }];
        [self pullBeginPullRefreshTransformAnimation];
        
    }
}

/**
 *  如果在应用内打了全局错误断点 那么在每个错误的释放的时候都会断点到这里 这时候 只要跳过这个断点就可以了
 *
 *  这是一个kvo的bug 在有些scrollview中没有租车contentoffset的kvo 
 *  但是在释放的时候都会进入到这个dealloc中 导致错误的释放了KVO
 *  所以在这里加入了try catch 块
 *  这不是应用崩溃了 只是一个警告
 */
-(void)dealloc{
    @try {[self removeObserver:self forKeyPath:@"contentOffset"];}@catch (NSException *exception) {}
}


@end


@implementation CALayer (XYPlusingRefresh_PauseResume)

-(void)XYPlusingRefresh_pause{
    self.speed = 1.0;
    self.hidden = YES;
}

-(void)XYPlusingRefresh_resume{
    self.speed = 1.0;
    self.hidden = NO;
}

-(void)XYPlusingRefresh_reset{
    self.speed = 0.0;
    self.hidden = YES;
}

@end
