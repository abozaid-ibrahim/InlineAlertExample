//
//  UIAlertPager.swift
//  InlineAlertExample
//
//  Created by Abuzeid Ibrahim on 12/3/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//

import UIKit

protocol Sizable {
    func sizeChangedTo(newSize: CGSize)
}

class AlertPagerView: UIView, Sizable {
    var alerts: [InlineAlertView]!
    func sizeChangedTo(newSize _: CGSize) {}
    
    var pageController: AlertPageViewController!
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(frame: CGRect, alerts: [InlineAlertView]) {
        self.init(frame: frame)
        self.alerts = alerts
        setPresentationLogic()
    }
    
    private func setPresentationLogic() {
        if alerts.count <= 1 {
            guard let alert = alerts.first else { return }
            addSubview(alert.view)
            alert.view.frame = bounds
        } else {
            let _ = alerts.map{$0.view.frame = self.bounds}
            pageController = AlertPageViewController(alerts: alerts)
            inputViewController?.addChildViewController(pageController)
            addSubview(pageController.view)
            pageController.view.frame = self.bounds
        }
    }
}
