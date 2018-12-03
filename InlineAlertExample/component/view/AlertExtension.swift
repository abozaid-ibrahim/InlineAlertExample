//
//  VFAlertExtension.swift
//  MyVodafone
//
//  Created by Abuzeid Ibrahim on 11/29/18.
//  Copyright © 2018 TSSE. All rights reserved.
//

import UIKit
extension UIView {
    func setCorners(radius: CGFloat = 10, borderColor: UIColor = UIColor.purple, borderWidth: CGFloat = 2) {
        layer.cornerRadius = radius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        layer.masksToBounds = true
    }
}

extension UIButton {
    private func actionHandleBlock(action: (() -> Void)? = nil) {
        struct __ {
            static var action: (() -> Void)?
        }
        if action != nil {
            __.action = action
        } else {
            __.action?()
        }
    }

    @objc private func triggerActionHandleBlock() {
        actionHandleBlock()
    }

    func actionHandle(control: UIControlEvents, forAction: @escaping () -> Void) {
        actionHandleBlock(action: forAction)
        addTarget(self, action: #selector(UIButton.triggerActionHandleBlock), for: control)
    }
}
