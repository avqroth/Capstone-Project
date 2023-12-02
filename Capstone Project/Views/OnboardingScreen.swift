//
//  OnboardingScreen.swift
//  Capstone Project
//
//  Created by Avery Roth on 12/1/23.
//

import SwiftUI

struct OnboardingScreen: View {
    @AppStorage("showOnboarding") private var showOnboarding: Bool = true

    let mainColor = Color("MainColor")
    let detailsColor = Color("DetailsColor")

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(mainColor)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Image(systemName: "dumbbell")
                    .foregroundColor(detailsColor)
                    .font(.system(size: 150))
                    .padding(.top, 100)

                Spacer()

                Text("Welcome To Log Flux!")
                    .multilineTextAlignment(.center)
                    .font(.custom("Avenir", size: 50))
                    .foregroundColor(.white)
                    .padding(.bottom, 75)

                Text("Log your workouts and search for your favorite exercises by muscle group/difficulty")
                    .padding([.leading, .trailing], 20)
                    .multilineTextAlignment(.center)
                    .font(.custom("Avenir", size: 20))
                    .foregroundColor(.white)
                    .padding(.bottom, 75)

                Button("Get Started") {
                    showOnboarding = false
                }
                .id("myButtonIdentifier")
                .accessibilityIdentifier("myButtonIdentifier")
                .foregroundColor(.white)
                .frame(width: 250)
                .padding()
                .background(detailsColor)
                .cornerRadius(10)
                .padding()

            }
        }
    }
}

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen()
    }
}
