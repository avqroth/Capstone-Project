//
//  LibraryView.swift
//  Capstone Project
//
//  Created by Avery Roth on 11/14/23.
//

import SwiftUI

struct SearchExerciseLibrary: View {

    enum MuscleGroup: String, CaseIterable {
        case abdominals
        case abductors
        case adductors
        case biceps
        case calves
        case chest
        case forearms
        case glutes
        case hamstrings
        case lats
        case lowerBack = "lower_back"
        case middleBack = "middle_back"
        case neck
        case quadriceps
        case traps
        case triceps
    }

    enum Difficulty: String, CaseIterable {
        case beginner
        case intermediate
        case expert
    }

    @State private var selectedMuscle: MuscleGroup = .abdominals
    @State private var selectedDifficulty: Difficulty = .beginner

    @State var searchText: String = ""
    @ObservedObject var exerciseStore = ExerciseStore()
    let mainColor = Color("MainColor")
    let detailsColor = Color("DetailsColor")

    @State private var errorMessage: String?

    var body: some View {
        VStack {
            HStack {
                Picker("Muscle", selection: $selectedMuscle) {
                    ForEach(MuscleGroup.allCases, id: \.self) {
                        Text($0.rawValue.capitalized)
                    }
                }

                Picker("Difficulty", selection: $selectedDifficulty) {
                    ForEach(Difficulty.allCases, id: \.self) {
                        Text($0.rawValue.capitalized)
                    }
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(mainColor, lineWidth: 2)
            )

            HStack {
                Button(action: {
                    Task {
                        do {
                            try await exerciseStore.searchExercises(
                                name: nil,
                                type: nil,
                                muscle: selectedMuscle.rawValue,
                                equipment: nil,
                                difficulty: selectedDifficulty.rawValue,
                                instructions: nil)
                            print("Fetched Data: \(exerciseStore.exercises)")
                        } catch {
                            errorMessage = "Error fetching data: \(error)"
                            print(errorMessage!)
                        }
                    }
                }) {
                    Text("Search")
                        .frame(width: 75, height: 25)
                        .foregroundColor(.white)
                        .padding()
                        .background(mainColor)
                        .cornerRadius(10)
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
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}



