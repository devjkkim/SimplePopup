//
//  SimplePopupView.swift
//  Pods-SimplePopup_Example
//
//  Created by DevJkkim on 2020/02/26.
//

import UIKit

public class SimplePopupView: UIView {
    
    // MARK: - UI Properties
    var popUpView: UIView!
    var lblTitle: UILabel!
    var lblMessage: UILabel!
    var actions: [SimpleAction]!
    
    // MARK: - Popup Style
    let titleFontSize:CGFloat = 18
    let messageFontSize:CGFloat = 16

    // MARK: - Input Data
    private var title: String?
    private var message: String?
    
    public init(title: String? = nil, message: String? = nil) {
        super.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        self.title = title
        self.message = message
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        let backgroundV = UIView(frame: CGRect(x: 0,
                                               y: 0,
                                               width: SCREEN_WIDTH,
                                               height: SCREEN_HEIGHT))
        backgroundV.backgroundColor = .init(white: 0.0, alpha: 0.7)
        self.addSubview(backgroundV)
        
        let popUpVW:CGFloat = 300
        let titleH = title?.height(withConstrainedWidth: popUpVW-2*padding, font: .systemFont(ofSize: titleFontSize)) ?? 0
        let messageH = message?.height(withConstrainedWidth: popUpVW-2*padding, font: .systemFont(ofSize: messageFontSize)) ?? 0
        let btnH:CGFloat = 50
        var lblGap:CGFloat = 0
        if title != nil && message != nil {
            lblGap = padding
        }
        
        popUpView = UIView(frame: CGRect(x: 0, y: 0, width: popUpVW, height: 2*padding+lblGap+titleH+messageH+btnH))
        popUpView.center = self.center
        popUpView.backgroundColor = .white
        popUpView.layer.cornerRadius = 10
        popUpView.layer.masksToBounds = true
        self.addSubview(popUpView)
        
        lblTitle = UILabel(frame: CGRect(x: padding, y: padding, width: popUpVW-2*padding, height: titleH))
        lblTitle.text = title
        lblTitle.font = .systemFont(ofSize: titleFontSize)
        lblTitle.textAlignment = .center
        lblTitle.numberOfLines = 0
        popUpView.addSubview(lblTitle)
        
        lblMessage = UILabel(frame: CGRect(x: padding, y: lblTitle.frame.origin.y+titleH+lblGap,
                                           width: popUpVW-2*padding, height: messageH))
        lblMessage.text = message
        lblMessage.font = .systemFont(ofSize: messageFontSize)
        lblMessage.textAlignment = .center
        lblMessage.numberOfLines = 0
        popUpView.addSubview(lblMessage)
        
        if actions != nil {
            let btnW = popUpVW/CGFloat(actions.count)
            for i in 0..<actions.count {
                let btn = UIButton()
                btn.frame = CGRect(x: CGFloat(i)*btnW, y: popUpView.frame.size.height-btnH, width: btnW, height: btnH)
                btn.setTitle(actions[i].title, for: .normal)
                btn.setTitleColor(actions[i].titleColor, for: .normal)
                btn.addTarget(self, action: #selector(execAction(_:)), for: .touchUpInside)
                btn.backgroundColor = actions[i].btnColor
                btn.tag = i
                popUpView.addSubview(btn)
            }
        }
    }
    
    public func addAction(_ action: SimpleAction) {
        if actions == nil {
            actions = [SimpleAction]()
        }
        actions.append(action)
    }
    
    public func show() {
        DispatchQueue.main.async {
            if UIApplication.shared.keyWindow == nil {
                return
            }
            
            self.setUI()
            UIApplication.shared.keyWindow?.addSubview(self)
        }
    }
    
    private func dismiss() {
        popUpView.alpha = 1
        UIView.animate(withDuration: 0.2, animations: {
            self.popUpView.alpha = 0
        }) { completion in
            let subViews = UIApplication.shared.keyWindow?.subviews
            subViews?.last?.removeFromSuperview()
        }
    }
    
    @objc private func execAction(_ sender: UIButton) {
        let action = actions[sender.tag]
        if let action = action.action {
            action()
        }
        
        dismiss()
    }
}
