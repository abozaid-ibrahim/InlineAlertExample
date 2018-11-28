//
//  ViewController.swift
//  InlineAlertExample
//
//  Created by Abuzeid Ibrahim on 11/28/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let st = UIStackView()
    let bt = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let alert  = VFInlineAlert(frame: CGRect(origin: CGPoint(x: 10, y: 40), size: CGSize(width: 400, height: 400)))
            .appendText(text: NSAttributedString(string:"Hello"))
            .addVerticalSeperator()
            .addAction(title: "Submit", action: {
                print("action is")
            }).addPadding()
            .appendText(text: NSAttributedString(string: "asdfa")).trimBottomSpace()
        
     
        view.addSubview(alert)
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
}
