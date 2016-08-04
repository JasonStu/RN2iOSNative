# RN2iOSNative
#[RN2iOSNative](https://github.com/JasonStu/RN2iOSNative)
# 前言
最近在写RN的项目的时候发现有个别页面,实在无法用RN来实现就,迫不得已之下就想必须要使用iOS的原生页面了!在使用原生也页面的时候遇到很多问题,发现都是各种姿势不对(姿势很重要)就在摸索的中,休息时突然得到了上帝佛主观音的提示完成了这伟事情!(废话说完入正题)!
###总结之前为什么跳转失败的原因
没有拿到navigation
没有拿到navigation
没有拿到navigation

# 配置关键代码
  1.在XCode 中的AppDelegate.h 添加 UINavigationController控件.
(这里为什么要添加 UINavigationController 因为在原生的页面跳转是需要 UINavigationController 的控制,或者说大部分跳转不过去是因为在iOS原生页面没有 UINavigationController 没有Navigation又怎么能今天页面的跳转呢?)
```
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
//关键代码
@property (nonatomic, strong) UINavigationController *nav;

@end
```
2.在.m文件中让 rootViewController 接受navigation的管理
```
//关键代码
  _nav=[[UINavigationController alloc]initWithRootViewController:rootViewController];
  _nav.navigationBarHidden = YES;
  
  self.window.rootViewController = _nav;

  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doNotification:) name:@"RNOpenVC" object:nil];
```

```
-(void)doNotification:(NSNotification *)notification
{
  NSLog(@"成功收到===>通知");
  //将通知里面的userInfo取出来，使用
  [self.nav pushViewControlle:" 你要跳转的页面" animated:YES];
   //注意不能在这里移除通知否则pus进去后有pop失效
  
}
```
3.新建 RCTBridgeModule 类 继承 NSObject 封装一个方法使用通知进行消息的传送从而实现页面的跳转
这里为什么这样写包含了很多RN与OC之间的通信如果大家想知道可以去[江清清老师](http://www.lcode.org/react-native%E8%BF%9B%E9%98%B6%E4%B9%8B%E5%8E%9F%E7%94%9F%E6%A8%A1%E5%9D%97%E5%B0%81%E8%A3%85%E5%9F%BA%E7%A1%80%E7%AF%87%E8%AF%A6%E8%A7%A3-%E9%80%82/)的博客看看我就不在这里叙述了

.h文件
```
#import <Foundation/Foundation.h>
#import "RCTBridgeModule.h"
@interface RNBridgeModule : NSObject<RCTBridgeModule>

@end
```
.m文件
```
#import "RNBridgeModule.h"
#import "RCTBridge.h"

@implementation RNBridgeModule
@synthesize bridge = _bridge;

RCT_EXPORT_MODULE(RNBridgeModule)
//RN跳转原生界面
RCT_EXPORT_METHOD(RNOpenVC:(NSString *)msg){
  
  NSLog(@"RN传入原生界面的数据为:%@",msg);
//主要这里必须使用主线程发送,不然有可能失效
  dispatch_async(dispatch_get_main_queue(), ^{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"RNOpenVC" object:nil];
  });
}
@end
```

大概思路就是这样!
如果大家还有说不懂我就直接去github下载 我的项目来看看[RN2iOSNative](https://github.com/JasonStu/RN2iOSNative)如果大家觉得有帮助给个✨✨Star✨Star✨Star✨✨

## 运行
```
$ git clone https://github.com/JasonStu/RN2iOSNative.git
$ cd RN2iOSNative
$ npm install
$ react-native run-ios
```
