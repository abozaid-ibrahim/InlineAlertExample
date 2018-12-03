//
//  InlineAlertUIStylingTest.swift
//  InlineAlertExampleTests
//
//  Created by Abuzeid Ibrahim on 11/29/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//

import XCTest

class InlineAlertUIStylingTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
    }

    func test_alertSeperatorStyling() {
        let image  = #imageLiteral(resourceName: "mobile")
        let alert  = VFInlineAlert(frame: CGRect(origin:.zero,size: CGSize(width: 200, height: 200)), icon: image )
            .addAction(title: "Report", action: {
                print("ation is")
            }).addVerticalSeperator()
        alert.style.primaryBGColor = .red
        alert.style.seperatorColor = .white
        XCTAssertEqual(alert.layer.borderColor, UIColor.red.cgColor)
        func test_alertStyling() {
            let image  = #imageLiteral(resourceName: "mobile")
            let alert  = VFInlineAlert(frame: CGRect(origin:.zero,size: CGSize(width: 200, height: 200)), icon: image )
                .addAction(title: "Report", action: {
                    print("ation is")
                }).addVerticalSeperator()
            alert.style.primaryBGColor = .red
            alert.style.seperatorColor = .white
            XCTAssertEqual(alert.layer.borderColor, UIColor.red.cgColor)
            XCTAssertEqual(alert.subviews., UIColor.red.cgColor)
            
        }
        XCTAssertEqual(alert.viewwi., UIColor.red.cgColor)
        
    }

}
