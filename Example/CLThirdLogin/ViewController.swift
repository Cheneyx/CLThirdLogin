//
//  ViewController.swift
//  CLThirdLogin
//
//  Created by CheneyDeveloper on 01/31/2023.
//  Copyright (c) 2023 CheneyDeveloper. All rights reserved.
//

import UIKit
import CLThirdLogin
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let login = CLThirdLoginView(Type: [.Apple(),.QQ()])
        login.frame = CGRect(x: 10, y: 200, width: 200, height: 50)
        view.addSubview(login)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

