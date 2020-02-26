//
//  ViewController.swift
//  SimplePopup
//
//  Created by devjkkim on 02/25/2020.
//  Copyright (c) 2020 devjkkim. All rights reserved.
//

import UIKit
import SimplePopup

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let v = SimplePopupView(title: "title", message: "message")
        let actionOK = SimpleAction(title: "test") {
            print("test clicked")
        }
        v.addAction(actionOK)
        
        let actionCancel = SimpleAction(title: "Cancel", titleColor: .white, btnColor: .black) {
            print("cancel clicked")
        }
        v.addAction(actionCancel)
        
        v.show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

