//
//  FeedLandingUITests.swift
//  RSSFeedTakeHomeSachinGargUITests
//
//  Created by sachin garg on 3/20/26.
//

import XCTest

final class FeedLandingUITests: XCTestCase {

    

    func test_Landing_component_exists() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Segment check
        let picker = app.segmentedControls["LimitPicker"]
        XCTAssertTrue(picker.exists)
        
        // Cards Chck
        XCTAssertTrue(app.otherElements["FeedCard_Album Feed"].waitForExistence(timeout: 2))

        XCTAssertTrue(app.otherElements["FeedCard_Podcast Feed"].exists)
        XCTAssertTrue(app.otherElements["FeedCard_Apps Feed"].exists)
        XCTAssertTrue(app.otherElements["FeedCard_Books Feed"].exists)
        XCTAssertTrue(app.otherElements["FeedCard_Audio Books"].exists)

        /*
         case music = "Album Feed"
         case podcasts = "Podcast Feed"
         case apps = "Apps Feed"
         case books = "Books Feed"
         case audioBooks = "Audio Books"
         */

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    
}
