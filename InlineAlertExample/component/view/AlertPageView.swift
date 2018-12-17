//
//  AlertPagerView.swift
//  InlineAlertExample
//
//  Created by Abuzeid Ibrahim on 12/3/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//

import UIKit


class AlertPagerView: UIView {
    private var alerts: [InlineAlertView]!
    func sizeChangedTo(newSize _: CGSize) {}
    
    private var pageController: AlertPageViewController!
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
    
    func replaceAlerts(newAlerts: [InlineAlertView]) {
        alerts.forEach { $0.view.removeFromSuperview() }
        pageController = nil
        
        alerts = newAlerts
        setPresentationLogic()
    }
    private func setPresentationLogic() {
        if alerts.count <= 1 {
            guard var alert = alerts.first else { return }
            alert.sizeDelegate = self
            addSubview(alert.view)
            alert.view.setSameBounds(self)
            alert.view.layoutIfNeeded()
            
        } else {
            for index in 0 ..< alerts.count {
                alerts[index].sizeDelegate = self
            }
            pageController = AlertPageViewController(alerts: alerts, frame: bounds)
            inputViewController?.addChildViewController(pageController)
            addSubview(pageController.view)
            pageController.view.setSameBounds(self)
            pageController.view.layoutIfNeeded()
        }
    }
}

extension AlertPagerView: ViewSizeObserver {
    func newSize(frame: CGRect) {
        self.frame = frame
        if pageController != nil {
            //            pageController.view.frame = bounds
            //            pageController.view.layoutIfNeeded()
        }
        layoutIfNeeded()
    }
}
