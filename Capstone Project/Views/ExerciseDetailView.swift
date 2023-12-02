//
//  ExerciseDetailView.swift
//  Capstone Project
//
//  Created by Avery Roth on 11/14/23.
//

import SwiftUI

struct ExerciseDetailView: View {
    let exercise: ExerciseEntry
    let mainColor = Color("MainColor")
    let detailsColor = Color("DetailsColor")
    
    private let detailFontSize = Double(20.0)
    private let detailFont = String("Avenir")
    private let detailPadding = Double(20.0)
    
    var body: some View {
        ScrollView {
            Image(systemName: "dumbbell")
                .foregroundColor(mainColor)
                .font(.system(size: 150))
                .padding()
            Text("\(exercise.name)")
                .multilineTextAlignment(.center)
                .foregroundColor(mainColor)
                .font(.custom(detailFont, size: 30))
                .padding()
                .background(detailsColor)
                .cornerRadius(50)
                .padding()
            ZStack {
                RectangleView()
                VStack(alignment: .center) {
                    Label(exercise.difficulty, systemImage: "trophy")
                        .foregroundColor(detailsColor)
                        .font(.custom(detailFont, size: detailFontSize))
                        .padding(detailPadding)
                    
                    Label(exercise.type, systemImage: "figure.strengthtraining.traditional")
                        .foregroundColor(detailsColor)
                        .font(.custom(detailFont, size: detailFontSize))
                        .padding(detailPadding)
                    
                    Label(exercise.equipment, systemImage: "dumbbell")
                        .foregroundColor(detailsColor)
                        .font(.custom(detailFont, size: detailFontSize))
                        .padding(detailPadding)
                    
                    Label(exercise.muscle, systemImage: "figure.stand")
                        .foregroundColor(detailsColor)
                        .font(.custom(detailFont, size: detailFontSize))
                        .padding(detailPadding)
                }
            } .padding()
            ZStack {
                RectangleView()
                VStack {
                    Label("Instruction", systemImage: "tray.full")
                        .foregroundColor(detailsColor)
                        .font(.custom("Avenir.bold", size: detailFontSize))
                        .padding(.top)
                    Text("\(exercise.instructions)")
                        .multilineTextAlignment(.center)
                        .foregroundColor(detailsColor)
                        .font(.custom("Avenir", size: 18))
                        .padding(detailPadding)
                } .padding(.all)
            }
        }
    }
}
struct RectangleView: View {
    let mainColor = Color("MainColor")
    
    var body: some View {
        Rectangle()
            .foregroundColor(mainColor)
            .frame(width: 350, height: .infinity)
            .cornerRadius(50)
    }
}





