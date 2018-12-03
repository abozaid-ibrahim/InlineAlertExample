//
//  VFServiceCategoryViewController.swift
//  MyVodafone
//
//  Created by Abuzeid Ibrahim on 11/29/18.
//  Copyright © 2018 TSSE. All rights reserved.
//

import UIKit
class VFServiceCategoryViewController: UIViewController {
    var siteId: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        insertAlertView()

    }
    func insertAlertView() {
        let defaultSize =  CGSize(width: view.bounds.width - 20, height: 400)
        let alert = InlineAlert(frame: CGRect(origin: .zero, size: defaultSize))
            .appendText(text: NSAttributedString(string: "Hello this is the sum tesxt that should appear here "))
            .addVerticalSeperator()
            .addAction(title: "Submit", action: {
                print("action is")
            })
            .addPadding()
            .trimBottomSpace()
        alert.style.primaryBGColor = .red

        
        
        
        let alert2 = InlineAlert(frame: CGRect(origin: .zero, size: defaultSize))
            .appendText(text: NSAttributedString(string: "Hello this is the sum tesxt that shadsfafd sum tesxt that shadsfafd sum tesxt that shadsfafd sum tesxt that shadsfafd sum tesxt that shadsfafdaould appear here "))
            .addVerticalSeperator()
            .addAction(title: "Submit", action: {
                print("action is")
            })
            .addPadding()
            .trimBottomSpace()
        
        let alert3 = InlineAlert(frame: CGRect(origin: .zero, size: defaultSize))
            .appendText(text: NSAttributedString(string: "Hello this is the sum tesxt that shadsfafd sum tesxt that shadsfafd sum tesxt that shadsfafd sum tesxt that shadsfafd sum tesxto this is the sum tesxt that shadsfafd sum tesxt that shadsfafd sum tesxt that shadsfafd sum tesxt that shadsfafd sum tesxt that shadsfafdaould a that shadsfafdaould appear here "))
            .addVerticalSeperator()
            .addAction(title: "Submit", action: {
                print("action is")
            })
        
        let pagerFrame = CGRect(origin: CGPoint(x: 0, y: 40), size: defaultSize)
        let alertPager = AlertPagerView(frame: pagerFrame, alerts: [alert, alert2,alert3])

        view.addSubview(alertPager)
    }

}
