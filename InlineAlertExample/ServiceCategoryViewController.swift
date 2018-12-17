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
        let defaultSize =  CGSize(width: view.bounds.width - 20, height: 320)
        let alert = InlineAlert(frame: CGRect(origin: .zero, size: defaultSize))
            .appendText(text: NSAttributedString(string: "Hello this is the sum tesxt that should appear here "))
            .addVerticalSeperator()
            .addAction(title: "share", action: {
                print("action share")
            })
            .addPadding()
        alert.style.primaryBGColor = .red

        
        
        
        let alert2 = InlineAlert(frame: CGRect(origin: .zero, size: defaultSize))
            .appendText(text: NSAttributedString(string: "Hello this is the sum tesxt that shadsfafd sum tesxt that shadsfafd sum tesxt that shadsfafd sum tesxt that shadsfafd sum tesxt that shadsfafdaould appear here "))
            .addVerticalSeperator()
            .addAction(title: "print", action: {
                print("action print")
            })
            .addPadding()
        
        let alert3 = InlineAlert(frame: CGRect(origin: .zero, size: defaultSize))
            .appendText(text: NSAttributedString(string: "Hello this is the sum tesxt that shadsfafd sum tesxt that shadsfafd sum tesxt that shadsfafd sum tesxt that shadsfafd sum tesxto this is the sum tesxt that shadsfafd sum tesxt that shadsfafd sum tesxt that shadsfafd sum tesxt that shadsfafd sum tesxt that shadsfafdaould a that shadsfafdaould appear here "))
            .addVerticalSeperator()
            .addAction(title: "Skipp", action: {
                print("action Skipp")
            })
        let pagerFrame = CGRect(origin: CGPoint(x: 10, y: 40), size: defaultSize)
        let alertPager = AlertPagerView(frame: pagerFrame, alerts: [alert, alert2,alert3])
        view.addSubview(alertPager)
        
//        alertPager.setSameFrame(view)
    }
   
}

extension AlertPagerView{
    func setSameFrame(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: leadingAnchor,constant:10).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor,constant:10).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor,constant:100).isActive = true
        
        view.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
}
