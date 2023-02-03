//
//  CLThirdLoginType.swift
//  CLThirdLogin
//
//  Created by Cheney on 2023/1/31.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation

public enum CLThirdLoginType {
    case Apple(icon: UIImage? = nil)
    case QQ(icon: UIImage? = nil)
    case WeChat(icon: UIImage? = nil)
}

extension CLThirdLoginType: Equatable{
    var IconImage: UIImage? {
        switch self {
        case .Apple(let icon):
            guard let image = icon else { return UIImage(inResource: "cl_login_apple") }
            return image
        case .QQ(let icon):
            guard let image = icon else { return UIImage(inResource: "cl_login_qq") }
            return image
        case .WeChat(let icon):
            guard let image = icon else { return UIImage(inResource: "cl_login_wx") }
            return image
        }
    }
    
    var Tags: Int {
        switch self {
        case .Apple:
            return 100
        case .QQ:
            return 101
        case .WeChat:
            return 102
        }
    }
}
