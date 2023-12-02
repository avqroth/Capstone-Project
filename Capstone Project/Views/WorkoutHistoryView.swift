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
    private let headerHeight: CGFloat = 50.0
    private let verticalSpacing: CGFloat = 5.0
    private let cornerRadius: CGFloat = 10.0
    private let mainColor = Color("MainColor")
    private let avenirFont = "Avenir"

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
            .frame(height: headerHeight)
            if saveWorkoutData.workouts.isEmpty {
                VStack {
                    Text("Looks like you don't have any workouts saved yet! Let's go add one!")
                        .multilineTextAlignment(.center)
                        .font(.custom("Avenir", size: 20))
                        .foregroundColor(.gray)
                        .opacity(0.5)
                }
                Spacer(minLength: 100)
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
            }
        }
    }
}
