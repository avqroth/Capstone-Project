//
//  Capstone_ProjectUITests.swift
//  Capstone ProjectUITests
//
//  Created by Avery Roth on 11/26/23.
//

import XCTest
@testable import Capstone_Project // Replace with your actual app module name

class ExerciseStoreTests: XCTestCase {

    var exerciseStore: ExerciseStore!

    @MainActor override func setUpWithError() throws {
        // Initialize ExerciseStore or use dependency injection if needed
        exerciseStore = ExerciseStore()
    }

    func testSearchExercises() {
        let expectation = expectation(description: "Search Exercises")

        // Simulate a valid search query
        let searchQuery = "Biceps"

        // Use dependency injection or mocking to provide a testable URLSession
        let mockURLSession = MockURLSession()
        exerciseStore.urlSession = mockURLSession

        // Perform the search
        exerciseStore.searchExercises(name: searchQuery, type: nil, muscle: nil, equipment: nil, difficulty: nil, instructions: nil) { result in
            switch result {
            case .success(let exercises):
                XCTAssertFalse(exercises.isEmpty)
            case .failure(let error):
                XCTFail("Search failed with error: \(error)")
            }
            expectation.fulfill()
        }

        // Wait for the expectation to be fulfilled (adjust the timeout if needed)
        waitForExpectations(timeout: 5, handler: nil)
    }
}

// Mock URLSession for testing
class MockURLSession: URLSessionProtocol {

    var data: Data?
    var response: URLResponse?
    var error: Error?

    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let task = MockURLSessionDataTask()
        task.completionHandler = { [weak self] in
            completionHandler(self?.data, self?.response, self?.error)
        }
        return task
    }
}

// Mock URLSessionDataTask for testing
class MockURLSessionDataTask: URLSessionDataTask {

    var completionHandler: (() -> Void)?

    override func resume() {
        completionHandler?()
    }
}

// Protocol for URLSession to facilitate dependency injection
protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}
