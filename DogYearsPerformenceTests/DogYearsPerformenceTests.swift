//
//  DogYearsPerformenceTests.swift
//  DogYearsPerformenceTests
//
//  Created by zmobile on 28/01/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import XCTest
@testable import DogYears

class DogYearsPerformenceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //:Performence Testing
    func testMenuLoadTesting() {
        var menu = Menu()
        self.measure {
            menu.loadDefaultMenu()
        }
    }

}
