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
    let mainColor = Color("MainColor")
    let detailsColor = Color("DetailsColor")
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("  'Example: Biceps'", text: $searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.vertical, 15)
                        .padding(.horizontal, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(mainColor, lineWidth: 2)
                        )
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
                }.padding()

                List(exerciseStore.exercises.indices, id: \.self) { index in
                    NavigationLink(destination: ExerciseDetailView(exercise: exerciseStore.exercises[index])) {
                        Image(systemName: "dumbbell")
                            .foregroundColor(mainColor)
                        Text(exerciseStore.exercises[index].name)
                            .font(.custom("Avenir.bold", size: 20))
                            .padding()
                    }
                }
            }.navigationTitle("Search Exercises")
        }
    }
}



