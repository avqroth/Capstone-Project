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
    @State private var alertTitle = "Error Fetching Exercises"

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
                                instructions: nil,
                                session: URLSession.shared
                            )
                            print("Fetched Data: \(exerciseStore.exercises)")
                        } catch {
                            if let error = error as? CapstoneError {
                                handleError(error)
                            }
                        }
                        isFetchingData = false
                    }
                })
                {
                    Text("Search")
                        .frame(width: 300, height: 10)
                        .foregroundColor(.white)
                        .padding()
                        .background(mainColor)
                        .cornerRadius(10)
                }
                .accessibility(identifier: "Search")
            }.padding()

            if isFetchingData {
                ProgressView("Fetching Exercises...")
                    .accessibility(identifier: "loadingIndicator")
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
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Error"),
                        message: Text(alertMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }
        }
    }

    func handleError(_ error: CapstoneError) {
        switch error {
        case .network:
            showAlert("No Network", message: "Please check your internet connection and try again.")
        case .api:
            showAlert("Server Error", message: "Unable to load exercices from server")
        case .noData:
            showAlert("No Data", message: "No exercises to display, please choose a different difficulty")
        }
    }
    
    func showAlert(_ title: String, message: String) {
        showAlert = true
        alertTitle = title
        alertMessage = message
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




