//
//  SaveWorkoutDataStore.swift
//  Capstone Project
//
//  Created by Avery Roth on 11/27/23.
//

import Foundation

struct Workout: Identifiable, Codable {
    var id = UUID()
    var workoutType: String
    var sets: String
    var reps: String
    var equipment: String
    var weight: String
    var notes: String
}

class SaveWorkoutData: ObservableObject {
    @Published var workouts: [Workout] = []

    init() {
        loadWorkouts()
    }

    func addWorkout(_ workout: Workout) {
        workouts.append(workout)
        saveWorkouts()
    }

    private func saveWorkouts() {
        if let encodedData = try? JSONEncoder().encode(workouts) {
            UserDefaults.standard.set(encodedData, forKey: "workouts")
        }
    }

    private func loadWorkouts() {
        if let savedWorkouts = UserDefaults.standard.data(forKey: "workouts"),
           let decodedWorkouts = try? JSONDecoder().decode([Workout].self, from: savedWorkouts) {
            workouts = decodedWorkouts
        }
    }

}
