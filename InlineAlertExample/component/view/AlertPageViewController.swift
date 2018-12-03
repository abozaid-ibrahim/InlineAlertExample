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
        didSet{
            self.pageControl.currentPage = currentIndex
        }
    }
    private var alerts: [InlineAlertView]!
    private var pageControl  = UIPageControl()
    init(alerts: [InlineAlertView]){
        super.init(nibName: nil, bundle: nil)
        self.alerts = alerts
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController!.dataSource = self
        let startingViewController: SingleAlertPageController = viewControllerAtIndex(index: currentIndex)!
        let viewControllers = [startingViewController]
        pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: false, completion: nil)
        addChildViewController(pageViewController!)
        view.addSubview(pageViewController!.view)
        pageViewController!.didMove(toParentViewController: self)
        self.addDots()
    }
    private func addDots(){
        self.pageControl.frame = CGRect(x: 0,y: 400,width: UIScreen.main.bounds.width,height: 50)
        self.pageControl.numberOfPages = alerts.count
        self.pageControl.currentPage = 1
        self.pageControl.alpha = 1.0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.red
        self.pageControl.currentPageIndicatorTintColor = UIColor.blue
        pageControl.currentPage = currentIndex
        self.view.addSubview(pageControl)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        
        // Create a new view controller and pass suitable data.
        let pageContentViewController = SingleAlertPageController(pageIndex: index,alert: alerts[index])
        
        pageContentViewController.pageIndex = index
        //        currentIndex = index
        
        return pageContentViewController
    }
    
    
}

class SingleAlertPageController: UIViewController {
    var pageIndex: Int 
    private var alert: InlineAlertView
    init(pageIndex:Int,alert: InlineAlertView) {
        self.alert = alert
        self.pageIndex = pageIndex
        super.init(nibName: nil, bundle: nil)
        self.view = UIView(frame: alert.view.bounds)
        view.addSubview(alert.view)
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
