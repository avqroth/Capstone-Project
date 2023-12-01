//
//  LogFlex_UIProjectTests.swift
//  LogFlex UIProjectTests
//
//  Created by Avery Roth on 11/30/23.
//

import XCTest

class ExerciseViewUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
// Testing the Search button for the Exercises
    func testSearchExerciseLibrarySearchButton() throws {
        let searchButton = app.buttons["Library"]
        XCTAssertNotNil(searchButton, "Search button should exist")
        searchButton.tap()

        if app.staticTexts["Fetching Exercises..."].exists {
            XCTAssertTrue(app.progressIndicators["loadingIndicator"].waitForExistence(timeout: 5), "Loading indicator should exist")
            XCTAssertTrue(app.progressIndicators["loadingIndicator"].isHittable, "Loading indicator should be visible and not hidden behind other elements")
        } else {
            XCTAssertFalse(app.progressIndicators["loadingIndicator"].exists, "Loading indicator should not exist")
        }
    }

// Testing the Add button
    func testAddWorkoutViewButton() throws {

        let addWorkoutButton = app.buttons["Add"]
        _ = XCTNSNotificationExpectation(name: Notification.Name("WorkoutAddedNotification"))
        addWorkoutButton.tap()
    }

    
}
