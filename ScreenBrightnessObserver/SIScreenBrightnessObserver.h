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

/// 通知UserInfo中屏幕亮度Key
extern NSString *const kScreenBrightness ;
/// 通知UserInfo中屏幕亮度样式Key
extern NSString *const kScreenBrightnessStyle;

/*
    信息包含在userInfo中,例如: { kScreenBrightness:@(0.2),kScreenBrightnessStyle:@(SIScreenBrightnessDark)}
 */
/// 屏幕亮度发送变化话的通知
extern NSString *const SIScreenBrightnessDidChangeNotification ;
/// 当Style发生改变时的通知
extern NSString *const SIScreenBrightnessStyleDidChangeNotification ;

@protocol SIScreenBrightnessObserverDelegate <NSObject>

@optional
/// 当屏幕的亮度发生变化后会调用
- (void)screenBrightnessDidChange:(CGFloat)brightness ;

/// 当Style发生改变时会调用
- (void)screenBrightnessStyleDidChange:(SIScreenBrightnessStyle)style ;

@end

@interface SIScreenBrightnessObserver : NSObject

/// 默认以MainScreen初始化
- (instancetype)init ;

/// 通过自定义Screen初始化对象
- (instancetype)initWithScreen:(UIScreen *)screen ;

/// 通过自定义Screen和门槛threshold值初始化
- (instancetype)initWithScreen:(UIScreen *)screen withThreshold:(CGFloat)threshold ;

/// Style发生改变的门槛,默认是0.5
@property (nonatomic,assign) CGFloat threshold ;

/// 屏幕变化后的代理
@property (nonatomic,weak) id<SIScreenBrightnessObserverDelegate> delegate ;

/// 屏幕信息,只读
@property (nonatomic,readonly) UIScreen *screen ;
/// 屏幕亮度,只读
@property (nonatomic,readonly) CGFloat screenBrightness ;
/// 屏幕亮度样式,只读
@property (nonatomic,readonly) SIScreenBrightnessStyle screenBrightnessStyle ;

@end
