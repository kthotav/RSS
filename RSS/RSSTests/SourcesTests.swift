//
//  SourcesTests.swift
//  RSSTests
//
//  Created by Karthik Personal on 2/13/19.
//  Copyright © 2019 VKT. All rights reserved.
//


import XCTest
@testable import RSS

class SourcesTests: XCTestCase {

    func testGetSources() {
        let exp = XCTestExpectation(description: "Sources != nil")
        SourcesAPI.service.getSources { result in
            switch result {
            case .failure: XCTFail()
            case .success(let sources):
                XCTAssertNotNil(sources)
                exp.fulfill()
            }
        }
        wait(for: [exp], timeout: 1)
    }
    
    func testGetSourcesWithClientError() {
        let exp = XCTestExpectation(description: "Error != nil")
        SourcesAPI.service.url = "https://newsapi.org/v2/sou"
        SourcesAPI.service.getSources { result in
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
