//
//  WorkoutHistory.swift
//  Capstone Project
//
//  Created by Avery Roth on 11/27/23.
//

import SwiftUI

struct WorkoutHistoryView: View {
    @ObservedObject var saveWorkoutData = SaveWorkoutData()

    private let detailFont: CGFloat = 20.0
    private let titleFont: CGFloat = 40.0
    private let headerHeight: CGFloat = 250.0
    private let verticalSpacing: CGFloat = 5.0
    private let cornerRadius: CGFloat = 10.0
    private let mainColor = Color("MainColor")
    private let avenirFont = "Avenir"

    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { geometry in
                Text("Workout History")
                    .font(.custom(avenirFont, size: titleFont))
                    .bold()
                    .frame(width: geometry.size.width, height: headerHeight)
                    .foregroundColor(mainColor)
                    .offset(y: geometry.frame(in: .global).minY > 0 ? -geometry.frame(in: .global).minY : 0)
                    .padding(.bottom, verticalSpacing)
            }
            .frame(height: headerHeight)

            if saveWorkoutData.workouts.isEmpty {
                Text("No workouts logged, please add your first one!")
                    .font(.custom(avenirFont, size: detailFont))
                    .foregroundColor(.white)
            } else {
                List(saveWorkoutData.workouts) { workout in
                    VStack() {
                        Text("Workout Type: \(workout.workoutType)")
                            .font(.custom(avenirFont, size: detailFont))
                            .bold()
                        Text("Sets: \(workout.sets)")
                            .font(.custom(avenirFont, size: detailFont))
                            .bold()
                        Text("Reps: \(workout.reps)")
                            .font(.custom(avenirFont, size: detailFont))
                            .bold()
                        Text("Equipment: \(workout.equipment)")
                            .font(.custom(avenirFont, size: detailFont))
                            .bold()
                        Text("Weights: \(workout.weight)")
                            .font(.custom(avenirFont, size: detailFont))
                            .bold()
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(cornerRadius)
                    .padding(.vertical, verticalSpacing)
                }
                .listStyle(InsetGroupedListStyle())
                .edgesIgnoringSafeArea(.top)
            }
        }
    }
}
