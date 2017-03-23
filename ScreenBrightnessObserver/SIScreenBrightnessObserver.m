//
//  ScreenBrightnessObserve.m
//  ScreenBrightnessObserveDemo
//
//  Created by 杨晴贺 on 2017/3/22.
//  Copyright © 2017年 Silence. All rights reserved.
//

#import "SIScreenBrightnessObserver.h"

/// 通知UserInfo中屏幕亮度Key
NSString *const kScreenBrightness = @"Brightness";

/// 通知UserInfo中屏幕亮度样式Key
NSString *const kScreenBrightnessStyle = @"ScreenBrightnessStyle";

/// 屏幕亮度发送变化话的通知
NSString *const SIScreenBrightnessDidChangeNotification = @"SIScreenBrightnessDidChangeNotification" ;

/// 当Style发生改变时的通知
NSString *const SIScreenBrightnessStyleDidChangeNotification = @"SIScreenBrightnessStyleDidChangeNotification" ;

@implementation SIScreenBrightnessObserver

- (instancetype)init{
    return [self initWithScreen:[UIScreen mainScreen]] ;
}

- (instancetype)initWithScreen:(UIScreen *)screen{
    return [self initWithScreen:screen withThreshold:0.5] ;
}

- (instancetype)initWithScreen:(UIScreen *)screen withThreshold:(CGFloat)threshold{
    if (self = [super init]) {
        _threshold = threshold ;
        _screenBrightnessStyle = [self screenBrightnessStyle:screen] ;
        _screen = screen ;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(brightnessDidChange:)
                                                     name:UIScreenBrightnessDidChangeNotification
                                                   object:screen] ;
    }
    return self ;
}


- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self] ;
}

- (void)brightnessDidChange:(NSNotification *)noti{
    UIScreen *screen = noti.object ;
    SIScreenBrightnessStyle brightnessStyle = [self screenBrightnessStyle:screen] ;
    if([self.delegate respondsToSelector:@selector(screenBrightnessDidChange:)]){
        [self.delegate screenBrightnessDidChange:screen.brightness] ;
    }
    
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary] ;
    [userInfo setObject:@(screen.brightness) forKey:kScreenBrightness] ;
    [userInfo setObject:@(brightnessStyle) forKey:kScreenBrightnessStyle] ;
    [[NSNotificationCenter defaultCenter] postNotificationName:SIScreenBrightnessDidChangeNotification object:nil userInfo:userInfo] ;
    
    if(self.screenBrightnessStyle == brightnessStyle) return ;
    _screenBrightnessStyle = brightnessStyle ;
    if ([self.delegate respondsToSelector:@selector(screenBrightnessStyleDidChange:)]) {
        [self.delegate screenBrightnessStyleDidChange:_screenBrightnessStyle] ;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:SIScreenBrightnessStyleDidChangeNotification object:nil userInfo:userInfo] ;
}

- (SIScreenBrightnessStyle)screenBrightnessStyle:(UIScreen *)screen{
    if(screen.brightness < _threshold){
        return SIScreenBrightnessDark ;
    }
    return SIScreenBrightnessLight ;
}

- (CGFloat)screenBrightness{
    return _screen.brightness ;
}

@end
