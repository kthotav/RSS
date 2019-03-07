//
//  HeadlinesTests.swift
//  RSSTests
//
//  Created by Karthik Personal on 3/5/19.
//  Copyright © 2019 VKT. All rights reserved.
//

import XCTest
@testable import RSS

class HeadlinesTests: XCTestCase {

    func testHeadlines() {
        let exp = XCTestExpectation(description: "Headlines != nil")
        HeadlinesAPI.shared.getHeadlines { result in
            switch result {
            case .success(let headlines):
                XCTAssertNotNil(headlines)
                exp.fulfill()
            case .failure: XCTFail()
            }
        }
        wait(for: [exp], timeout: 1)
    }
    
    func testHeadlinesWithClientError() {
        let exp = XCTestExpectation(description: "Error != nil")
        HeadlinesAPI.shared.url = "https://newsapi.org/v2/top-headlines"
        HeadlinesAPI.shared.getHeadlines { result in
            switch result {
            case .failure(let error):
                XCTAssertNotNil(error)
                exp.fulfill()
            case .success: XCTFail()
            }
        }
        wait(for: [exp], timeout: 1)
    }

}
