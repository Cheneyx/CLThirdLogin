//
//  Publish_header.m
//  CLThirdLogin
//
//  Created by Cheney on 2023/1/31.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

#import "Publish_header.h"
#import <TencentOpenAPI/TencentOpenApiUmbrellaHeader.h>
#import "WXApi.h"
@implementation Publish_header

+ (BOOL)isInstallQQ {
    return TencentOAuth.iphoneQQInstalled;
    return  YES;
}

+ (BOOL)isInstallWeChat {
    return  WXApi.isWXAppInstalled;
    return  YES;
}

+ (void)WeChatLogin {
    SendAuthReq *req = [[SendAuthReq alloc]  init];
    req.scope = @"snsapi_userinfo";
    req.state = @"wx_oauth_authorization_state";
    [WXApi sendReq:req completion:^(BOOL success) {
        NSLog(@"发送微信登录---->>>>%@", success ? @"成功" : @"失败");
    }];
}

+ (void)QQLogin {
    
}

@end
