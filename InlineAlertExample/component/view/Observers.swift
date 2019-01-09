//
//  Observers.swift
//  InlineAlertExample
//
//  Created by abuzeid on 1/9/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import UIKit

protocol ViewSizeObserver {
    func newSize(frame: CGRect)
}
protocol IndexObserver {
    func indexChanged(index: Int)
}
