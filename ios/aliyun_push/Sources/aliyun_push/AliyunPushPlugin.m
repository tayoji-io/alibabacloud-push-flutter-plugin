#import "AliyunPushPlugin.h"

// ponytail: iOS 阿里云推送已移除，这里只保留空壳。
// 仍然注册 channel，让所有调用返回“不支持”，而不是抛 MissingPluginException。
@implementation AliyunPushPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel =
      [FlutterMethodChannel methodChannelWithName:@"aliyun_push"
                                  binaryMessenger:[registrar messenger]];
  [registrar addMethodCallDelegate:[[AliyunPushPlugin alloc] init] channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  NSString* method = call.method;
  if ([method isEqualToString:@"getDeviceId"] ||
      [method isEqualToString:@"getApnsDeviceToken"]) {
    result(@"");
  } else if ([method isEqualToString:@"isChannelOpened"] ||
             [method isEqualToString:@"isNotificationEnabled"]) {
    result(@(NO));
  } else {
    // kAliyunPushNotSupport
    result(@{@"code" : @"10005", @"errorMsg" : @"iOS push is removed"});
  }
}

@end
