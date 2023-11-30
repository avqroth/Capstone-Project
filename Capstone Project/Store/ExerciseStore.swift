//
//  ProductStore.swift
//  Capstone Project
//
//  Created by Avery Roth on 11/12/23.
//

import Foundation

@MainActor
class ExerciseStore: ObservableObject {
    
    @Published var exercises: [ExerciseEntry] = []
    let baseURL = "https://api.api-ninjas.com/v1/exercises"

    private func readApiKeyFromPlist() -> String? {
            guard let path = Bundle.main.path(forResource: "APIKeys", ofType: "plist"),
                  let keys = NSDictionary(contentsOfFile: path),
                  let apiKey = keys["API Key"] as? String
            else {
                return nil
            }
            return apiKey
        }
    
    func searchExercises(name: String?, type: String?, muscle: String?, equipment: String?, difficulty: String?, instructions: String?) async throws {
        guard let url = URL(string: baseURL) else {
            throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
        }
        
        var request = URLRequest(url: url)
        var queryItems: [URLQueryItem] = []
        if let name = name {
            queryItems.append(URLQueryItem(name: "name", value: name))
        }
        if let type = type {
            queryItems.append(URLQueryItem(name: "type", value: type))
        }
        if let muscle = muscle {
            queryItems.append(URLQueryItem(name: "muscle", value: muscle))
        }
        if let difficulty = difficulty {
            queryItems.append(URLQueryItem(name: "difficulty", value: difficulty))
        }
        if let instructions = instructions {
            queryItems.append(URLQueryItem(name: "instructions", value: instructions))
        }

        request.url?.append(queryItems: queryItems)

        if let apiKey = readApiKeyFromPlist() {
                    request.addValue(apiKey, forHTTPHeaderField: "X-Api-Key")
                } else {
                    throw NSError(domain: "API Key Error", code: 0, userInfo: nil)
                }
        
        print("~~~~ URL Request \n \(request) \n \(String(describing: request.allHTTPHeaderFields))")
        let (data, response) = try await URLSession.shared.data(for: request)
        
        print("~~~~ URL Response \(response)")
        if let httpResponse = response as? HTTPURLResponse {
            switch httpResponse.statusCode {
            case 200...204:
                let decoder = JSONDecoder()
                exercises = try decoder.decode([ExerciseEntry].self, from: data)
                print("search successful")
            default:
                print("~~~~ HTTP Error \(httpResponse.statusCode)")
            }
        }
    }
}








