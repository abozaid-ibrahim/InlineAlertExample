//
//  VFServiceCategoryViewController.swift
//  MyVodafone
//
//  Created by Abuzeid Ibrahim on 11/29/18.
//  Copyright © 2018 TSSE. All rights reserved.
//

import UIKit
class VFServiceCategoryViewController: UIViewController {
    @IBOutlet weak var alertsContainer: UIView!
    @IBOutlet weak var alertsHeightConstrain: NSLayoutConstraint!
    var siteId: String!
    var  alertPager:AlertPagerView?
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
        alert.style.primaryBGColor = .yellow
        
        
        
        
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
        
        
        
        addAlertsIntoViewPager(alerts: [alert,alert2,alert3])
    }
  
    func addAlertsIntoViewPager(alerts: [InlineAlert]) {
        guard alerts.count > 0 else { return }
        alerts.forEach { print($0.viewContentHeight) }
        let maxAlertHeight = alerts.map { $0.viewContentHeight }.max() ?? 0
        if alertPager == nil {
            alertPager = AlertPagerView(frame: alertsContainer.bounds, alerts: alerts)
            alertsContainer.addSubview(alertPager!)
            guard let pager = alertPager,
                let container = alertsContainer else {
                    return
            }
            pager.setSameBounds(container)
            
            container.layoutIfNeeded()
        } else {
            alertPager?.replaceAlerts(newAlerts: alerts)
        }
        setAlertsContainerHeight(alerts, maxAlertHeight)

    }
 
    private func setAlertsContainerHeight(_ alerts: [InlineAlert], _ firstAlertHeight: CGFloat) {
        alertsContainer.translatesAutoresizingMaskIntoConstraints = false
        let dotsHeight: CGFloat = 50
        alertsHeightConstrain.constant = alerts.count > 1 ? firstAlertHeight + dotsHeight : firstAlertHeight
    }
}
extension VFServiceCategoryViewController: ViewSizeObserver {
    func newSize(frame: CGRect) {
//setAlertsContainerHeight(3, 230)
        view.layoutIfNeeded()
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
