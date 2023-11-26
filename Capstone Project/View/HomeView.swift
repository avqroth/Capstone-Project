//
//  HomeView.swift
//  Capstone Project
//
//  Created by Avery Roth on 11/26/23.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab: Tab = .house

    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {

        ZStack {
//            VStack {
//                TabView(selection: $selectedTab) {
//
//                    HomeView()
//                    SearchExerciseLibrary()
//                    AddWorkoutView()
//
//                }
//            }
            VStack {
                Spacer()
                CustomTabView(selectedTab: $selectedTab)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
