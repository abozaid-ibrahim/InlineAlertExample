//
//  InlineAlert.swift
//  InlineAlertExample
//
//  Created by Abuzeid Ibrahim on 11/28/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//

import UIKit
typealias InlineAlertButtonAction = (() -> Void)
protocol InlineAlertView {
    var view: UIView { get }
    init(frame: CGRect, icon: UIImage)
    func append(view: UIView) -> Self
    func appendText(text: NSAttributedString) -> Self
    func addVerticalSeperator() -> Self
    func addAction(title: String, action: @escaping InlineAlertButtonAction) -> Self
    func addPadding() -> Self
    var sizeDelegate: ViewSizeObserver? { get set }
    var viewContentHeight: CGFloat { get }
}
