//
//  ScreenBrightnessObserve.h
//  ScreenBrightnessObserveDemo
//
//  Created by 杨晴贺 on 2017/3/22.
//  Copyright © 2017年 Silence. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,SIScreenBrightnessStyle) {
    SIScreenBrightnessLight = 0 ,
    SIScreenBrightnessDark
};


/// 屏幕亮度发送变化话的通知
extern NSString *const SIScreenBrightnessDidChangeNotification ;

/// 当Style发生改变时的通知
extern NSString *const SIScreenBrightnessStyleDidChangeNotification ;

@protocol SIScreenBrightnessObserverDelegate <NSObject>

/// 当屏幕的亮度发生变化后会调用
- (void)screenBrightnessDidChange:(CGFloat)brightness ;

/// 当Style发生改变时会调用
- (void)screenBrightnessStyleDidChange:(SIScreenBrightnessStyle)style ;

@end

@interface SIScreenBrightnessObserver : NSObject


- (instancetype)initWithScreen:(UIScreen *)screen ;
- (instancetype)initWithScreen:(UIScreen *)screen withThreshold:(CGFloat)threshold ;

/// Style发生改变的门槛,默认是0.5
@property (nonatomic,assign) CGFloat threshold ;
@property (nonatomic,weak) id<SIScreenBrightnessObserverDelegate> delegate ;


@property (nonatomic,readonly) UIScreen *screen ;
@property (nonatomic,readonly) CGFloat screenBrightness ;
@property (nonatomic,readonly) SIScreenBrightnessStyle screenBrightnessStyle ;

@end
