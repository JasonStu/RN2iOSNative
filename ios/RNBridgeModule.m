//
//  RNBridgeModule.m
//  RN2iOSNative
//
//  Created by Jason on 16/8/4.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "RNBridgeModule.h"
#import "RCTBridge.h"

@implementation RNBridgeModule
@synthesize bridge = _bridge;

RCT_EXPORT_MODULE(RNBridgeModule)
//RN跳转原生界面
RCT_EXPORT_METHOD(RNOpenVC:(NSString *)msg){
  
  NSLog(@"RN传入原生界面的数据为:%@",msg);
  dispatch_async(dispatch_get_main_queue(), ^{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"RNOpenVC" object:nil];
  });
}
@end
