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
        let actionCancel = SimpleAction(title: "Cancel") {
            print("Cancel button clicked")
        }
        v.addAction(actionCancel)
        
        let actionOK = SimpleAction(title: "OK", titleColor: .white, btnColor: .black) {
            print("OK button clicked")
        }
        v.addAction(actionOK)
        
        v.show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

