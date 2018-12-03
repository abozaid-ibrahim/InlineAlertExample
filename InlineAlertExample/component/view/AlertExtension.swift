//
//  VFAlertExtension.swift
//  MyVodafone
//
//  Created by Abuzeid Ibrahim on 11/29/18.
//  Copyright © 2018 TSSE. All rights reserved.
//

import UIKit

typealias ButtonAction = (() -> Void)
protocol InlineAlertView {
    var view: UIView { get }
    init(frame: CGRect, icon: UIImage)
    func append(view: UIView) -> Self
    func appendText(text: NSAttributedString) -> Self
    func addVerticalSeperator() -> Self
    func addAction(title: String, action: @escaping ButtonAction) -> Self
    func addPadding() -> Self
    func trimBottomSpace() -> Self
}

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
