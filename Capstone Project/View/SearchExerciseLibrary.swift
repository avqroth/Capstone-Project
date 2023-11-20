//
//  LibraryView.swift
//  Capstone Project
//
//  Created by Avery Roth on 11/14/23.
//

import SwiftUI

struct SearchExerciseLibrary: View {
    @State var searchText: String = ""
    @ObservedObject var exerciseStore = ExerciseStore()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search Exercises", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .onSubmit {
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
                ScrollView {
                    ForEach(exerciseStore.exercises) { exercise in
                            NavigationLink(destination: ExerciseDetailView(exercise: exercise)) {
                                Text(exercise.name)
                                    .padding()
                        }
                    }
                }
            }
            .navigationTitle("Search Exercises")
        }
    }
}

struct SearchExerciseLibrary_Previews: PreviewProvider {
    static var previews: some View {
        SearchExerciseLibrary()
    }
}

