//
//  LogFlex_Project_Tests.swift
//  LogFlex Project Tests
//
//  Created by Avery Roth on 11/30/23.
//

import XCTest

@testable import Capstone_Project

class MockURLSession: URLSessionProtocol {
    var responseData: (Data, URLResponse)?
    var error: Error?
    
    init(responseData: (Data, URLResponse)) {
        self.responseData = responseData
    }

    init(error: Error) {
        self.error = error
    }

    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        if let responseData = responseData {
            return responseData
        } else if let error = error {
            throw error
        }
        throw CapstoneError.noData
    }
}

@MainActor
class ExerciseStoreTests: XCTestCase {
    let testData = "[{\"name\": \"Dumbbell spell caster\", \"type\": \"strength\", \"muscle\": \"abdominals\", \"equipment\": \"dumbbell\", \"difficulty\": \"beginner\", \"instructions\": \"Hold a dumbbell in each hand with a pronated grip. Your feet should be wide with your hips and knees extended. This will be your starting position. Begin the movement by pulling both of the dumbbells to one side next to your hip, rotating your torso. Keeping your arms straight and the dumbbells parallel to the ground, rotate your torso to swing the weights to your opposite side. Continue alternating, rotating from one side to the other until the set is complete.\"},{\"name\": \"Plate Twist\", \"type\": \"strength\", \"muscle\": \"abdominals\", \"equipment\": \"other\", \"difficulty\": \"beginner\", \"instructions\": \"Lie down on the floor or an exercise mat with your legs fully extended and your upper body upright. Grab the plate by its sides with both hands out in front of your abdominals with your arms slightly bent. Slowly cross your legs near your ankles and lift them up off the ground. Your knees should also be bent slightly. Note: Move your upper body back slightly to help keep you balanced turning this exercise. This is the starting position. Move the plate to the left side and touch the floor with it. Breathe out as you perform that movement. Come back to the starting position as you breathe in and then repeat the movement but this time to the right side of the body. Tip: Use a slow controlled movement at all times. Jerking motions can injure the back. Repeat for the recommended amount of repetitions.\"}]"

    func testSearchExercisesSuccess() {
        let exerciseStore = ExerciseStore()
        let mockSession = MockURLSession(responseData: (testData.data(using: .utf8)!, HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!))

        let expectation = XCTestExpectation(description: "Search Exercises")

        Task {
            do {
                try await exerciseStore.searchExercises(
                    name: "Biceps",
                    type: nil,
                    muscle: nil,
                    equipment: nil,
                    difficulty: nil,
                    instructions: nil,
                    session: mockSession
                )
                XCTAssertEqual(exerciseStore.exercises.count, 2) // Adjust as needed
            } catch {
                XCTFail("Search failed with error: \(error)")
            }
        }
        expectation.fulfill()

        wait(for: [expectation], timeout: 5)
    }

    // Testing to make sure we are getting the correct error...
    func testSearchExercisesFailure() {
        let exerciseStore = ExerciseStore()
        let mockSession = MockURLSession(error: NSError())

        let expectation = XCTestExpectation(description: "Search Exercises Failure")

        Task {
            do {
                try await exerciseStore.searchExercises(
                    name: "InvalidName",
                    type: nil,
                    muscle: nil,
                    equipment: nil,
                    difficulty: nil,
                    instructions: nil,
                    session: mockSession
                )
                XCTFail("Search should have failed, but it succeeded.")
            } catch is CapstoneError {
                XCTAssertTrue(true, "Expected error")
            } catch {
                XCTAssertTrue(false, "Unexpected error")
            }
        }
        expectation.fulfill()

        wait(for: [expectation], timeout: 5)
    }
}
