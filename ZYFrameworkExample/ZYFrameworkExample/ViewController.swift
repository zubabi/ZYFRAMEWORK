//
//  ViewController.swift
//  ZYFrameworkExample
//
//  Created by Zübeyir Yayıkçı on 19.09.2019.
//  Copyright © 2019 Zübeyir Yayıkçı. All rights reserved.
//

import UIKit
import ZYFramework

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        print(Handshake.Ping())
        print(2.square())
        print(2.square().square())
        print(2.square().square().square())

        // print(Handshake.Ping())
        
        //this is from developer
    }
}

extension Int {
    func square() -> Int {
        return self * self
    }
}
