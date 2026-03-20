//
//  NavigationToFeedListTests.swift
//  RSSFeedTakeHomeSachinGargUITests
//
//  Created by sachin garg on 3/20/26.
//

import XCTest

final class NavigationToFeedListTests: XCTestCase {

   
    func testNavigation_toFeedList() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.otherElements["FeedCard_Album Feed"].tap()
        
        // Feed rows should load expected
        let firstRow = app.cells.firstMatch
        XCTAssertTrue(firstRow.waitForExistence(timeout: 5))
        

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
