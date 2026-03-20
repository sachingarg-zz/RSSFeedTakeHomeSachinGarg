//
//  FeedSearchFilterTests.swift
//  RSSFeedTakeHomeSachinGargUITests
//
//  Created by sachin garg on 3/20/26.
//

import XCTest

final class FeedSearchFilterTests: XCTestCase {

    func testFeedListViewScreen_SearchTest() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.otherElements["FeedCard_Album Feed"].tap()
        
        // Feed rows should load expected
        let searchField = app.searchFields.firstMatch
        XCTAssertTrue(searchField.waitForExistence(timeout: 5))
        
        searchField.tap()
        searchField.typeText("Octa")
        
        // Expected result
        let results = app.cells
        XCTAssertTrue(results.count > 0, "search result success")

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
