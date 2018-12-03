//
//  InlineAlertExampleTests.swift
//  InlineAlertExampleTests
//
//  Created by Abuzeid Ibrahim on 11/28/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//

import XCTest
@testable import InlineAlertExample

class InlineAlertTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func test_alertStyling() {
        let image  = #imageLiteral(resourceName: "mobile")
        let alert  = VFInlineAlert(frame: CGRect(origin:.zero,size: CGSize(width: 200, height: 200)), icon: image )
        .addAction(title: "Report", action: {
            print("ation is")
        }).addVerticalSeperator()
        alert.style.primaryBGColor = .red
        alert.style.seperatorColor = .white
        XCTAssertEqual(alert.layer.borderColor, UIColor.red.cgColor)
        
    }

   

}
