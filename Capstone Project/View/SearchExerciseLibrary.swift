//
//  LibraryView.swift
//  Capstone Project
//
//  Created by Avery Roth on 11/14/23.
//

import SwiftUI

struct SearchExerciseLibrary: View {
    @ObservedObject var exerciseStore = ExerciseStore()

    @State var selectedMuscle: MuscleGroup = .abdominals
    @State var selectedDifficulty: Difficulty = .beginner
    @State var isFetchingData = false
    @State var searchText: String = ""
    @State var errorMessage: String?
    @State private var showAlert = false
    @State private var alertMessage = ""

    let mainColor = Color("MainColor")
    let detailsColor = Color("DetailsColor")

    var body: some View {
        VStack {
            Spacer()
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
                        isFetchingData = true
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
                        isFetchingData = false
                    }
                }) {
                    Text("Search")
                        .frame(width: 300, height: 10)
                        .foregroundColor(.white)
                        .padding()
                        .background(mainColor)
                        .cornerRadius(10)
                }
            }.padding()

            if isFetchingData {
                ProgressView("Fetching Exercises...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            }

            List(exerciseStore.exercises.indices, id: \.self) { index in
                NavigationLink(destination: ExerciseDetailView(exercise: exerciseStore.exercises[index])) {
                    Image(systemName: "dumbbell")
                        .foregroundColor(mainColor)
                    Text(exerciseStore.exercises[index].name)
                        .font(.custom("Avenir.bold", size: 20))
                        .padding()
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)

            Button(action: {
                           Task {
                               isFetchingData = true
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

                                   if let networkError = error as? NetworkError, networkError == .noNetwork {
                                       showAlert = true
                                       alertMessage = "No network connection. Please check your internet connection and try again."
                                   }
                               }
                               isFetchingData = false
                           }
                       }) {
                           Text("Search")
                               .frame(width: 300, height: 10)
                               .foregroundColor(.white)
                               .padding()
                               .background(mainColor)
                               .cornerRadius(10)
                       }
                   }.padding()
                   .alert(isPresented: $showAlert) {
                       Alert(
                           title: Text("Error"),
                           message: Text(alertMessage),
                           dismissButton: .default(Text("OK"))
                       )
                   }
               }
           }

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
}




