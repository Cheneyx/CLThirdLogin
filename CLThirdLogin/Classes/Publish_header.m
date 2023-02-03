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

@end
