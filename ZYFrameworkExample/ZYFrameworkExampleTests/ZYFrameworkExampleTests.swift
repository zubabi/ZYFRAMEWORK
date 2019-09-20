//
//  ZYFrameworkExampleTests.swift
//  ZYFrameworkExampleTests
//
//  Created by Zübeyir Yayıkçı on 20.09.2019.
//  Copyright © 2019 Zübeyir Yayıkçı. All rights reserved.
//

import XCTest
@testable import ZYFrameworkExample

class ZYFrameworkExampleTests: XCTestCase {
    func testHelloWorld() {
        print("testHelloWorld started")
        var helloWorld: String?
        XCTAssertNil(helloWorld)
        helloWorld = "Hello world"
        XCTAssertEqual(helloWorld, "Hello world")
    }

    func testTimeAgoString() {
        print("testTimeAgoString started")
        let fiveMinsAgo = Date(timeIntervalSinceNow: -5 * 60)
        let fiveMinsAgoDisplay = fiveMinsAgo.timeAgoDisplay()
        XCTAssertEqual(fiveMinsAgoDisplay, "5 minutes ago")
    }

    func testSquareInt() {
        print("testSquareInt started")
        let value = 3
        XCTAssertEqual(value.square(), 9)
    }
}
