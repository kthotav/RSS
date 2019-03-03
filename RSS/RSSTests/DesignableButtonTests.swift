//
//  DesignableButtonTests.swift
//  RSSTests
//
//  Created by Karthik Personal on 3/3/19.
//  Copyright © 2019 VKT. All rights reserved.
//

import XCTest
@testable import RSS

class DesignableButtonTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let button = DesignableButton()
        let expectedCornerRadius = CGFloat.random(in: 0...10)
        button.cornerRadius = expectedCornerRadius
        XCTAssertEqual(button.layer.cornerRadius, expectedCornerRadius)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
