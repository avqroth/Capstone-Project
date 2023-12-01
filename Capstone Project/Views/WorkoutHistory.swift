//
//  WorkoutHistory.swift
//  Capstone Project
//
//  Created by Avery Roth on 11/27/23.
//

import SwiftUI

struct WorkoutHistoryView: View {
    @ObservedObject var saveWorkoutData = SaveWorkoutData()

    var body: some View {
        NavigationView {
            List(saveWorkoutData.workouts) { workout in
                VStack(alignment: .leading) {
                    Text("Workout Type: \(workout.workoutType)")
                    Text("Sets: \(workout.sets)")
                    Text("Reps: \(workout.reps)")
                    Text("Equipment: \(workout.equipment)")
                    Text("Weights: \(workout.weight)")
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(.vertical, 5)
            }
            .padding()
            .navigationBarTitle("Workout History")
        }
    }
}
