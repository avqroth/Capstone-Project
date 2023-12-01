//
//  SearchBar.swift
//  Capstone Project
//
//  Created by Avery Roth on 11/20/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String
    @ObservedObject var exerciseStore = ExerciseStore()
    let searchText = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 8)

            TextField(placeholder, text: $text)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.vertical, 10)
                .padding(.horizontal, 8)
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                .onSubmit {
                    print("Submit tapped")
                    Task {
                        do {
                            try await exerciseStore.searchExercises(name: nil, type: nil, muscle: searchText, equipment: nil, difficulty: nil, instructions: nil)
                            print("Fectched Data: \(exerciseStore.exercises)")
                        }
                        catch {
                            print("Error fetching data: \(error)")
                        }
                    }
                }
        }
        .padding()
        .background(Color.white)
    }
}
