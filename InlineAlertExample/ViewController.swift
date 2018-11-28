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
                            })



                        alert.view.backgroundColor = .green
                        alert.view.layoutSubviews()
                        view.addSubview(alert.view)
        
//        test()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    func test(){
        st.axis = .vertical
        st.distribution = .fill
        st.alignment = .top
        
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bt.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        let bt2 = UILabel()
        bt2.backgroundColor = .green
        bt2.translatesAutoresizingMaskIntoConstraints = false
        bt2.widthAnchor.constraint(equalToConstant: 300).isActive = true
        bt2.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        bt.backgroundColor = .red
        bt.setTitle("Asf", for: .normal)
        st.addArrangedSubview(bt)
        st.addArrangedSubview(bt2)
        st.translatesAutoresizingMaskIntoConstraints = false
//        st.frame = CGRect(origin: .zero, size: CGSize(width: 300, height: 400))
//        st.translatesAutoresizingMaskIntoConstraints = false
//        st.widthAnchor.constraint(equalToConstant: 400).isActive = true
//        st.heightAnchor.constraint(equalToConstant: 500).isActive = true
        self.view.addSubview(st)
        
    }
}
