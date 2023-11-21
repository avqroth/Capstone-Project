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
                HStack {
                    TextField("Search Exercises", text: $searchText)
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
                    
                        .padding()
                        .background(Color.white)
                }
                List(exerciseStore.exercises.indices, id: \.self) { index in
                    NavigationLink(destination: ExerciseDetailView(exercise: exerciseStore.exercises[index])) {
                        Image(systemName: "dumbbell")
                        Text(exerciseStore.exercises[index].name)
                            .padding()
                    }
                }
                .listStyle(.sidebar)
            }
            .navigationTitle("Exercise Library")
        }
    }
}


