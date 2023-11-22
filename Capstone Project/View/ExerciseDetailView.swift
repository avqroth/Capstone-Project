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
                VStack {
                    HStack {
                        Image(systemName: "trophy")
                            .foregroundColor(.white)
                            .font(.system(size: 15))

                        Text("DIFFICULTY:   \(exercise.difficulty)")
                            .foregroundColor(.white)
                            .font(.custom("HelveticaNeue.ultralight", size: 15))
                            .padding()
                    }
                    HStack {
                        Image(systemName: "figure.strengthtraining.traditional")
                            .foregroundColor(.white)
                            .font(.system(size: 15))

                        Text("TYPE:   \(exercise.type)")
                            .foregroundColor(.white)
                            .font(.custom("HelveticaNeue.ultralight", size: 15))
                            .padding()
                    }
                    HStack {
                        Image(systemName: "dumbbell.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 15))

                        Text("EQUIPMENT USED:   \(exercise.equipment)")
                            .foregroundColor(.white)
                            .font(.custom("HelveticaNeue.ultralight", size: 15))
                            .padding()
                    }
                    HStack {
                        Image(systemName: "figure.mixed.cardio")
                            .foregroundColor(.white)
                            .font(.system(size: 15))

                        Text("MUSCLE GROUP:   \(exercise.muscle)")
                            .foregroundColor(.white)
                            .font(.custom("HelveticaNeue.ultralight", size: 15))
                            .padding()
                    }

                }
            }
//            .padding()
//            ZStack {
//                RectangleView()
//                HStack {
//                    Image(systemName: "figure.stand")
//                        .foregroundColor(.white)
//                        .font(.system(size: 30))
//                        .padding(2)
//
//                    Text("\(exercise.muscle)")
//                        .foregroundColor(.white)
//                        .font(.custom("HelveticaNeue.ultralight", size: 20))
//                        .padding()
//                }
//            }
//            .padding()
//            ZStack {
//                RectangleView()
//                HStack {
//                    Image(systemName: "dumbbell.fill")
//                        .foregroundColor(.white)
//                        .font(.system(size: 30))
//                        .padding(2)
//
//                    Text("\(exercise.equipment)")
//                        .foregroundColor(.white)
//                        .font(.custom("HelveticaNeue.ultralight", size: 20))
//                        .padding()
//                }
//            }
        }
    }
}

struct RectangleView: View {
    let mainColor = Color("MainColor")

    var body: some View {
        Rectangle()
            .foregroundColor(mainColor)
            .frame(width: 350, height: 400)
            .cornerRadius(20)
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



