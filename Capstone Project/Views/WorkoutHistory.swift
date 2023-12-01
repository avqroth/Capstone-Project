//
//  WorkoutHistory.swift
//  Capstone Project
//
//  Created by Avery Roth on 11/27/23.
//

import SwiftUI

struct WorkoutHistoryView: View {
    @ObservedObject var saveWorkoutData = SaveWorkoutData()
    let detailFont = Double(20.0)
    let mainColor = Color("MainColor")

    var body: some View {
            VStack {
                Spacer(minLength: 75)
                GeometryReader { geometry in
                    Text("Workout History")
                        .font(.custom("Avenir", size: 40))
                        .bold()
                        .frame(width: geometry.size.width, height: 250)
                        .foregroundColor(mainColor)
                        .offset(y: geometry.frame(in: .global).minY > 0 ? -geometry.frame(in: .global).minY : 0)
                        .padding(.bottom)
                }
                .frame(height: 50)

                List(saveWorkoutData.workouts) { workout in
                    VStack(alignment: .leading) {
                        Text("Workout Type: \(workout.workoutType)")
                            .font(.custom("Avenir", size: detailFont))
                            .bold()
                        Text("Sets: \(workout.sets)")
                            .font(.custom("Avenir", size: detailFont))
                            .bold()
                        Text("Reps: \(workout.reps)")
                            .font(.custom("Avenir", size: detailFont))
                            .bold()
                        Text("Equipment: \(workout.equipment)")
                            .font(.custom("Avenir", size: detailFont))
                            .bold()
                        Text("Weights: \(workout.weight)")
                            .font(.custom("Avenir", size: detailFont))
                            .bold()
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.vertical, 5)
                }
                .listStyle(InsetGroupedListStyle())
                .edgesIgnoringSafeArea(.top)
        }
    }
}
