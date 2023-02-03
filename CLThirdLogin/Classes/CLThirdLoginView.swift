//
//  CLThirdLoginView.swift
//  CLThirdLogin
//
//  Created by Cheney on 2023/1/31.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit

public class CLThirdLoginView: UIView {
    private lazy var itemView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .horizontal
        stack.spacing = 22
        return stack
    }()
    
    private lazy var topTitle: UILabel = {
        let lab = UILabel()
        lab.text = "其他登录方式"
        lab.textColor = UIColor.cssHex("#999999")
        lab.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return lab
    }()
    
    var ThitdLoginBlock: ((CLThirdLoginType)->(Void))?
    
    private let thidTyps: [CLThirdLoginType]
    
    public init(Type: [CLThirdLoginType]) {
        thidTyps = Type

        super.init(frame: .zero)

        setupUI()
    }
    
    private func setupUI() {
        addSubview(itemView)
        addSubview(topTitle)
        for type in thidTyps {
            let btn = UIButton()
            btn.setImage(type.IconImage, for: .normal)
            btn.addTarget(self, action: #selector(thidLoginBtnClick(_ :)), for: .touchUpInside)
            btn.tag = 100 + type.Tags
//            if type == .Apple(), #available(iOS 13, *) {
                itemView.addArrangedSubview(btn)
//            }
//            } else if type == .WeChat(), WXApi.isWXAppInstalled(){
//                itemView.addArrangedSubview(btn)
//            } else if type == .QQ(), QQApiInterface.isQQInstalled() {
//                itemView.addArrangedSubview(btn)
//            }
        }

        self.isHidden = itemView.subviews.count == 0
        
        topTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        itemView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(topTitle.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.width.greaterThanOrEqualTo(topTitle.snp.width)
            make.left.right.bottom.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CLThirdLoginView {
    @objc func thidLoginBtnClick(_ btn: UIButton) {
        switch btn.tag - 100 {
        case 100:
            self.ThitdLoginBlock?(.Apple())
        case 101:
            self.ThitdLoginBlock?(.QQ())
        case 102:
            self.ThitdLoginBlock?(.WeChat())
        default:
            break
        }
    }
}
