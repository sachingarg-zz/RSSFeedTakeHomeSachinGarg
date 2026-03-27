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
        
    }
    
    func test_Landing_Picker_limitSelection() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Segment check
        let limitPicker = app.segmentedControls["LimitPicker"]
        XCTAssertTrue(limitPicker.exists)
        
        // Tap button 20
        limitPicker.buttons["20"].tap()
        XCTAssertTrue(limitPicker.buttons["20"].isSelected)
        
        // Tap button 20
        limitPicker.buttons["30"].tap()
        XCTAssertTrue(limitPicker.buttons["30"].isSelected)
        
        // Tap button 10
        limitPicker.buttons["10"].tap()
        XCTAssertTrue(limitPicker.buttons["10"].isSelected)
        
    }
    
}
