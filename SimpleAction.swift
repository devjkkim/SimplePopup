//
//  SimpleAction.swift
//  Pods
//
//  Created by spt donga on 2020/02/26.
//

import Foundation

public class SimpleAction: NSObject {
    var title: String!
    var titleColor: UIColor!
    var btnColor: UIColor!
    var action: (()->())?
    
    public init(title: String, titleColor: UIColor? = .black, btnColor: UIColor? = .init(white: 0.9, alpha: 1.0), action: (()->())? = nil) {
        self.title = title
        self.titleColor = titleColor
        self.btnColor = btnColor
        self.action = action
    }
}
