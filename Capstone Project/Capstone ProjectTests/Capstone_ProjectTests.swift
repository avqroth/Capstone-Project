//
//  Capstone_ProjectTests.swift
//  Capstone ProjectTests
//
//  Created by Avery Roth on 11/26/23.
//

//import XCTest
//@testable import Capstone_Project
//
//class MockNetworkService: NetworkService {
//    func fetchData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
//        if url.absoluteString == "https://api.api-ninjas.com/v1/exercises" {
//            let mockData = Data()
//            completion(mockData, nil)
//        } else {
//            let error = NSError(domain: "MockNetworkError", code: 404, userInfo: nil)
//            completion(nil, error)
//        }
//    }
//}
//
//class ExerciseStoreTests: XCTestCase {
//    @MainActor func testSearchExercisesWithMockNetwork() {
//        let mockNetworkService = MockNetworkService()
//
//        let exerciseStore = ExerciseStore(networkService: mockNetworkService)
//
//    }
//}
