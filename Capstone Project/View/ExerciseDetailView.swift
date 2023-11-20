//
//  ExerciseDetailView.swift
//  Capstone Project
//
//  Created by Avery Roth on 11/14/23.
//

import SwiftUI

struct ExerciseDetailView: View {
    let exercise: ExerciseEntry
    
    var body: some View {
        Text("Name: \(exercise.name)")
            .padding()
        Text("Type: \(exercise.type)")
            .padding()
        Text("Muscle: \(exercise.muscle)")
            .padding()
        Text("Equipment: \(exercise.equipment)")
            .padding()
        Text("Difficulty: \(exercise.difficulty)")
            .padding()
        Text("Instructions: \(exercise.instructions)")
    }
}

//struct ExerciseDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseDetailView()
//    }
//}
