//
//  Publish_header.h
//  CLThirdLogin
//
//  Created by Cheney on 2023/1/31.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Publish_header : NSObject

+(BOOL)isInstallQQ;

+(BOOL)isInstallWeChat;

+(void)WeChatLogin;

+(void)QQLogin;

@end

NS_ASSUME_NONNULL_END
