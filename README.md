# ScreenBrightnessObserver

![Language](https://img.shields.io/badge/language-objc-orange.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)  

一个简单的屏幕亮度观察,可以用来做简单的主题切换

### 导入
将项目中`ScreenBrightnessObserver`文件夹拖到项目里  

### 使用
1. 导入头文件

	```objective-c
	#import "SIScreenBrightnessObserver.h"
	```

2. 保留观察者对象


	```objective-c
	@implementation ViewController{
    	SIScreenBrightnessObserver *_observer ; // 需要对这个对象进行引用,否则释放后不能进行监听
	}
	```
	
3. 初始化

	```objective-c
    _observer = [[SIScreenBrightnessObserver alloc]init] ; // 以MainScreen初始化
    _observer.delegate = self ; // 设置代理
    _observer.threshold = 0.4 ; // 设置门槛
	```
	
4. 实现代理方法或监听通知

	```objective-c
	// 当屏幕亮度发生改变时调用
	- (void)screenBrightnessDidChange:(CGFloat)brightness{
    	self.brightnessLabel.text = [NSString stringWithFormat:@"%.2f",brightness] ;
	}

	// 当屏幕亮度主题发生改变时
	- (void)screenBrightnessStyleDidChange:(SIScreenBrightnessStyle)style{
    	if (style == SIScreenBrightnessDark) {
        	self.StyleLabel.text = @"Dark" ;
    	}else{
        	self.StyleLabel.text = @"Light" ;
    	}
	}
	```
	
## ScreenBrightnessObserver
ScreenBrightnessObserver is available under the MIT license. See the LICENSE file for more info.