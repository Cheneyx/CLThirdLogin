//
//  UIColor+Extension.swift
//  CLThirdLogin
//
//  Created by Cheney on 2023/1/31.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

extension UIColor {
    /// 字符串转颜色
    ///
    /// - Parameter colorStr: 字符串,如#FFFFFF 或者 如#1a000000
    /// - Returns: 返回颜色
    static func cssHex(_ colorString: String) -> UIColor {
        var cStr = colorString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if cStr.hasPrefix("#") {
            let index = cStr.index(after: cStr.startIndex)
            // cStr = cStr.substring(from: index)
            cStr = String(cStr[index...])
        }
        
        if cStr.count == 6 {
            return color(cStr: cStr)
        } else if cStr.count == 8 {
            return colorWithAlpha(cStr: cStr)
        } else {
            return UIColor.clear
        }
    }
    
    /// UInt32转颜色
    ///
    /// - Parameter colorNumber: UInt32
    /// - Returns: 返回颜色
    static func cssHex(_ colorNumber: Int) -> UIColor {
        let cStr = "\(colorNumber)"
        
        if cStr.count == 6 {
            return color(cStr: cStr)
        } else if cStr.count == 8 {
            return colorWithAlpha(cStr: cStr)
        } else {
            return UIColor.clear
        }
    }
    
    /// 6位字符串转颜色
    ///
    /// - Parameter cStr: 6位字符串转没有涉及透明度的颜色
    /// - Returns: 返回颜色
    private static func color(cStr: String) -> UIColor {
        var color = UIColor.white
        
        let rRange = cStr.startIndex ..< cStr.index(cStr.startIndex, offsetBy: 2)
        // let rStr = cStr.substring(with: rRange)
        let rStr = String(cStr[rRange])
        
        let gRange = cStr.index(cStr.startIndex, offsetBy: 2) ..< cStr.index(cStr.startIndex, offsetBy: 4)
        // let gStr = cStr.substring(with: gRange)
        let gStr = String(cStr[gRange])
        
        let bIndex = cStr.index(cStr.endIndex, offsetBy: -2)
        // let bStr = cStr.substring(from: bIndex)
        let bStr = String(cStr[bIndex...])
        
        var r: CUnsignedInt = 0, g: CUnsignedInt = 0, b: CUnsignedInt = 0
        Scanner(string: rStr).scanHexInt32(&r)
        Scanner(string: gStr).scanHexInt32(&g)
        Scanner(string: bStr).scanHexInt32(&b)
        
        color = UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
        
        return color
    }
    
    /// 8位字符串转颜色
    ///
    /// - Parameter cStr: 8位字符串转涉及透明度的颜色
    /// - Returns: 返回颜色
    private static func colorWithAlpha(cStr: String) -> UIColor {
        var color = UIColor.white
        
        let aRange = cStr.startIndex ..< cStr.index(cStr.startIndex, offsetBy: 2)
        let aStr = String(cStr[aRange])
        
        let rRange = cStr.index(cStr.startIndex, offsetBy: 2) ..< cStr.index(cStr.startIndex, offsetBy: 4)
        let rStr = String(cStr[rRange])
        
        let gRange = cStr.index(cStr.startIndex, offsetBy: 4) ..< cStr.index(cStr.startIndex, offsetBy: 6)
        let gStr = String(cStr[gRange])
        
        let bIndex = cStr.index(cStr.endIndex, offsetBy: -2)
        let bStr = String(cStr[bIndex...])
        
        var a: CUnsignedInt = 0, r: CUnsignedInt = 0, g: CUnsignedInt = 0, b: CUnsignedInt = 0
        Scanner(string: aStr).scanHexInt32(&a)
        Scanner(string: rStr).scanHexInt32(&r)
        Scanner(string: gStr).scanHexInt32(&g)
        Scanner(string: bStr).scanHexInt32(&b)
        
        color = UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(a) / 255.0)
        
        return color
    }
    
    /// 使用rgba方式生成自定义颜色
    ///
    /// - Parameters:
    ///   - r: red
    ///   - g: green
    ///   - b: blue
    ///   - a: alpha
    convenience init(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat = 1) {
        let red = r / 255.0
        let green = g / 255.0
        let blue = b / 255.0
        self.init(red: red, green: green, blue: blue, alpha: a)
    }
}

extension UIImage {
    convenience init?(inResource named: String) {
        func staticBundle() -> Bundle? {
            let bundle = Bundle(for: CLThirdLoginView.self)
            guard let path = bundle.path(forResource: "CLThirdLogin", ofType: "bundle"),
                  let bund = Bundle(path: path)
            else {
                return nil
            }
//            let bundle = Bundle(url: url)
            return bund
        }
        
        self.init(named: named, in: staticBundle(), compatibleWith: nil)
    }
}
