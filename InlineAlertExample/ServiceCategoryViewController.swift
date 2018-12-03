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
        let alert = InlineAlert(frame: CGRect(origin: CGPoint(x: 10, y: 40), size: CGSize(width: 400, height: 400)))
            .appendText(text: NSAttributedString(string: "Hello this is the sum tesxt that should appear here "))
            .addVerticalSeperator()
            .addAction(title: "Submit", action: {
                print("action is")
            })
            .addPadding()
            .trimBottomSpace()
        alert.style.primaryBGColor = .red

        
        
        
        let alert2 = InlineAlert(frame: CGRect(origin: CGPoint(x: 100, y: 40), size: CGSize(width: 400, height: 400)))
            .appendText(text: NSAttributedString(string: "Hello this is the sum tesxt that shadsfafd sum tesxt that shadsfafd sum tesxt that shadsfafd sum tesxt that shadsfafd sum tesxt that shadsfafdaould appear here "))
            .addVerticalSeperator()
            .addAction(title: "Submit", action: {
                print("action is")
            })
            .addPadding()
            .trimBottomSpace()
        
        
        let pagerFrame = CGRect(origin: CGPoint(x: 0, y: 40), size: CGSize(width: 400, height: 400))
        let alertPager = AlertPagerView(frame: pagerFrame, alerts: [alert, alert2,alert])

        view.addSubview(alertPager)
    }

}
