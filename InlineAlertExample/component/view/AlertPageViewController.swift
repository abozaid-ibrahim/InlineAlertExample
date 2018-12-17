//
//  AlertPageViewController.swift
//  InlineAlertExample
//
//  Created by Abuzeid Ibrahim on 12/3/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//

import UIKit

class AlertPageViewController: UIViewController, UIPageViewControllerDataSource {
    private var pageViewController: UIPageViewController?
    private var currentIndex: Int = 0 {
        didSet {
            pageControl.currentPage = currentIndex
            pageControl.customPageControl(dotFillColor: UIColor.gray, dotBorderColor: UIColor.gray, dotBorderWidth: 1)
        }
    }
    
    private var frame: CGRect
    private var alerts: [InlineAlertView]
    private var pageControl = CustomImagePageControl()
    init(alerts: [InlineAlertView], frame: CGRect) {
        self.frame = frame
        self.alerts = alerts
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController!.dataSource = self
        let startingViewController: SingleAlertPageController = viewControllerAtIndex(index: currentIndex)!
        let viewControllers = [startingViewController]
        pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: false, completion: nil)
        addChildViewController(pageViewController!)
        view.addSubview(pageViewController!.view)
        setViewConstrain(subView: pageViewController!.view)
        
        pageViewController!.didMove(toParentViewController: self)
        addDots()
    }
    
    func setViewConstrain(subView: UIView) {
        subView.translatesAutoresizingMaskIntoConstraints = false
        subView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        subView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        subView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        subView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    }
    
    private func addDots() {
        pageControl.numberOfPages = alerts.count
        pageControl.currentPage = 1
        pageControl.alpha = 1.0
        pageControl.backgroundColor = .clear
        pageControl.currentPage = currentIndex
        view.addSubview(pageControl)
        setDotsConstrains()
    }
    
    private func setDotsConstrains() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func pageViewController(_: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! SingleAlertPageController).pageIndex
        currentIndex = index
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        index -= 1
        return viewControllerAtIndex(index: index)
    }
    
    func pageViewController(_: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! SingleAlertPageController).pageIndex
        currentIndex = index
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        
        if index == alerts.count {
            return nil
        }
        
        return viewControllerAtIndex(index: index)
    }
    
    func presentationCountForPageViewController(pageViewController _: UIPageViewController) -> Int {
        return alerts.count
    }
    
    func presentationIndexForPageViewController(pageViewController _: UIPageViewController) -> Int {
        return 0
    }
    
    func viewControllerAtIndex(index: Int) -> SingleAlertPageController? {
        if alerts.count == 0 || index >= alerts.count {
            return nil
        }
        let pageContentViewController = SingleAlertPageController(pageIndex: index, alert: alerts[index])
        pageContentViewController.pageIndex = index
        
        return pageContentViewController
    }
}

class SingleAlertPageController: UIViewController {
    var pageIndex: Int
    private var alert: InlineAlertView
    init(pageIndex: Int, alert: InlineAlertView) {
        self.alert = alert
        self.pageIndex = pageIndex
        super.init(nibName: nil, bundle: nil)
        view = alert.view
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView {
    func setSameBounds(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

