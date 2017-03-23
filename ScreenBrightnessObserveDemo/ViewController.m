//
//  ViewController.m
//  ScreenBrightnessObserveDemo
//
//  Created by 杨晴贺 on 2017/3/22.
//  Copyright © 2017年 Silence. All rights reserved.
//

#import "ViewController.h"
#import "SIScreenBrightnessObserver.h"

@interface ViewController ()<SIScreenBrightnessObserverDelegate>
@property (weak, nonatomic) IBOutlet UILabel *StyleLabel;
@property (weak, nonatomic) IBOutlet UILabel *brightnessLabel;

@end

@implementation ViewController{
    SIScreenBrightnessObserver *_observer ; // 需要对这个对象进行引用,否则释放后不能进行监听
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _observer = [[SIScreenBrightnessObserver alloc]init] ; // 以MainScreen初始化
    _observer.delegate = self ; // 设置代理
    _observer.threshold = 0.4 ; // 设置门槛
    
    self.StyleLabel.text = _observer.screenBrightnessStyle == SIScreenBrightnessLight ? @"Light" : @"Dark" ;
    self.brightnessLabel.text = [NSString stringWithFormat:@"%.2f",_observer.screenBrightness] ;
}

- (void)screenBrightnessDidChange:(CGFloat)brightness{
    self.brightnessLabel.text = [NSString stringWithFormat:@"%.2f",brightness] ;
}

- (void)screenBrightnessStyleDidChange:(SIScreenBrightnessStyle)style{
    if (style == SIScreenBrightnessDark) {
        self.StyleLabel.text = @"Dark" ;
    }else{
        self.StyleLabel.text = @"Light" ;
    }
}

@end

