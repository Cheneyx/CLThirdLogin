//
//  CLThirdLoginType.swift
//  CLThirdLogin
//
//  Created by Cheney on 2023/1/31.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation

public enum CLThirdLoginType {
    case Apple(icon: String? = nil)
    case QQ(icon: String? = nil)
    case WeChat(icon: String? = nil)
}

extension CLThirdLoginType: Equatable{
    var IconImage: UIImage? {
        switch self {
        case .Apple(let icon):
            guard let name = icon else { return UIImage(named: "cl_login_apple") }
            return UIImage(named: name)
        case .QQ(let icon):
            guard let name = icon else { return UIImage(named: "cl_login_qq") }
            return UIImage(named: name)
        case .WeChat(let icon):
            guard let name = icon else { return UIImage(named: "cl_login_wx") }
            return UIImage(named: name)
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
