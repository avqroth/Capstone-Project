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
        ScrollView {
            ZStack {
                RectangleView()
                HStack {
                    Image(systemName: "figure.strengthtraining.traditional")
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .padding(2)

                    Text("\(exercise.name)")
                        .foregroundColor(.white)
                        .font(.custom("HelveticaNeue.ultralight", size: 20))
                        .padding()
                }
            }
            .padding()
            ZStack {
                RectangleView()
                HStack {
                    Image(systemName: "figure.stand")
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .padding(2)
                    
                    Text("\(exercise.muscle)")
                        .foregroundColor(.white)
                        .font(.custom("HelveticaNeue.ultralight", size: 20))
                        .padding()
                }
            }
            .padding()
            ZStack {
                RectangleView()
                HStack {
                    Image(systemName: "dumbbell.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .padding(2)

                    Text("\(exercise.equipment)")
                        .foregroundColor(.white)
                        .font(.custom("HelveticaNeue.ultralight", size: 20))
                        .padding()
                }
            }
        }
    }
}

struct RectangleView: View {
    let mainColor = Color("MainColor")

    var body: some View {
        Rectangle()
            .foregroundColor(mainColor)
            .frame(width: 350, height: 75)
            .cornerRadius(10)
    }
}






//        Text("Name: \(exercise.name)")
//            .padding()
//        Text("Type: \(exercise.type)")
//            .padding()
//        Text("Muscle: \(exercise.muscle)")
//            .padding()
//        Text("Equipment: \(exercise.equipment)")
//            .padding()
//        Text("Difficulty: \(exercise.difficulty)")
//            .padding()
//        Text("Instructions: \(exercise.instructions)")



