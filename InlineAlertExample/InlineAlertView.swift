//
//  InlineAlertView.swift
//  InlineAlertExample
//
//  Created by Abuzeid Ibrahim on 11/28/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//

import UIKit

typealias ButtonAction = (()->Void)
protocol InlineAlert {
    init(frame:CGRect,icon:UIImage)
    func append(view:UIView)->Self
    func appendText(text:NSAttributedString)->Self
    func addVerticalSeperator()->Self
    func addAction(title:String, action:@escaping ButtonAction)->Self
    func trimBottomSpace() -> Self
}
