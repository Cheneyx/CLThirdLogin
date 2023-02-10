//
//  ViewController.swift
//  CLThirdLogin
//
//  Created by CheneyDeveloper on 01/31/2023.
//  Copyright (c) 2023 CheneyDeveloper. All rights reserved.
//

import UIKit
import CLThirdLogin
import SnapKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let t = CLThirdLoginView(Type: [.apple(), .wechat(), .qq()])

        view.addSubview(t)
        
        t.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

