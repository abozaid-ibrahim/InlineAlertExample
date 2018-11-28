//
//  UIViewExtension.swift
//  InlineAlertExample
//
//  Created by Abuzeid Ibrahim on 11/28/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//

import UIKit

extension UIView{
    func setCorners(radius:CGFloat = 10, borderColor:UIColor = UIColor.purple ,borderWidth:CGFloat = 2){
        self.layer.cornerRadius = radius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.masksToBounds = true
    }
}

extension UIButton {
    private func actionHandleBlock(action:(() -> Void)? = nil) {
        struct __ {
            static var action :(() -> Void)?
        }
        if action != nil {
            __.action = action
        } else {
            __.action?()
        }
    }
    
    @objc private func triggerActionHandleBlock() {
        self.actionHandleBlock()
    }
    
    func actionHandle(control :UIControlEvents, forAction:@escaping () -> Void) {
        self.actionHandleBlock(action: forAction)
        self.addTarget(self, action: #selector(UIButton.triggerActionHandleBlock), for: control)
    }
}
