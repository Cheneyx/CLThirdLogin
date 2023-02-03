//
//  CLThirdLoginType.swift
//  CLThirdLogin
//
//  Created by Cheney on 2023/1/31.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation

public enum CLThirdLoginType {
    case apple(icon: UIImage? = nil)
    case qq(icon: UIImage? = nil)
    case wechat(icon: UIImage? = nil)
}

extension CLThirdLoginType: Equatable{
    var IconImage: UIImage? {
        switch self {
        case .apple(let icon):
            guard let image = icon else { return UIImage(inResource: "cl_login_apple") }
            return image
        case .qq(let icon):
            guard let image = icon else { return UIImage(inResource: "cl_login_qq") }
            return image
        case .wechat(let icon):
            guard let image = icon else { return UIImage(inResource: "cl_login_wx") }
            return image
        }
    }
    
    var Tags: Int {
        switch self {
        case .apple:
            return 100
        case .qq:
            return 101
        case .wechat:
            return 102
        }
    }
}
