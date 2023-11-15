//
//  ProductStore.swift
//  Capstone Project
//
//  Created by Avery Roth on 11/12/23.
//

import Foundation

class ExerciseStore: ObservableObject {
    
    @Published var exerciseModel: [ExerciseModel] = []
    
    let baseURL = "https://api.api-ninjas.com/v1/exercises"
    let apiKey = "hR6Iw2LHj6uuuSORutM67w==1pfvrt338inBbIud"
    
    func searchExerciseEntries(query: String) async throws {
        guard let url = URL(string: baseURL) else {
            throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
        }

        var request = URLRequest(url: url)
        request.url?.append(queryItems: [URLQueryItem(name: "query", value: query)])
        request.addValue(apiKey, forHTTPHeaderField: "x-api-key")

        print("~~~~ URL Request \n \(request) \n \(String(describing: request.allHTTPHeaderFields))")
        let (data, response) = try await URLSession.shared.data(for: request)

        print("~~~~ URL Response \(response)")
        if let httpResponse = response as? HTTPURLResponse {
            switch httpResponse.statusCode {
            case 200...204:
                let decoder = JSONDecoder()
                exerciseModel = try decoder.decode([ExerciseModel].self, from: data)
                print("image search successful")
            default:
                print("~~~~ HTTP Error \(httpResponse.statusCode)")
            }
        }
    }
}





