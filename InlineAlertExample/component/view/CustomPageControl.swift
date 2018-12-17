//
//  CustomPageControl.swift
//  InlineAlertExample
//
//  Created by Abuzeid Ibrahim on 12/17/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//

import UIKit
class CustomImagePageControl: UIPageControl {
    let activeImage: UIImage = #imageLiteral(resourceName: "mobile")
    let inactiveImage: UIImage = #imageLiteral(resourceName: "mobile")

    override func draw(_: CGRect) {
        backgroundColor = .clear
        customPageControl(dotFillColor: UIColor.gray, dotBorderColor: UIColor.gray, dotBorderWidth: 1)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        customPageControl(dotFillColor: UIColor.gray, dotBorderColor: UIColor.gray, dotBorderWidth: 1)
        clipsToBounds = false
    }
}

extension UIPageControl {
    func customPageControl(dotFillColor: UIColor, dotBorderColor: UIColor, dotBorderWidth: CGFloat) {
        for (pageIndex, dotView) in subviews.enumerated() {
            if currentPage == pageIndex {
                dotView.backgroundColor = dotFillColor
            } else {
                dotView.backgroundColor = .clear
                dotView.layer.borderColor = dotBorderColor.cgColor
                dotView.layer.borderWidth = dotBorderWidth
            }
        }
    }
}
