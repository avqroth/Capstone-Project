//
//  ContentView.swift
//  Capstone Project
//
//  Created by Avery Roth on 11/12/23.
//

import SwiftUI

struct ContentView: View {@State private var selectedTab: Tab = .tab1
    
    enum Tab {
        case tab1, tab2, tab3, tab4
    }
    
    let mainColor = Color("MainColor")
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            HomeView()
                .tag(Tab.tab1)
                .tabItem {
                    Label("Home", systemImage: "house")
                        .font(.custom("Avenir.bold", size: 22))
                }
            
            AddWorkoutView()
                .tag(Tab.tab2)
                .tabItem {
                    Label("Add", systemImage: "plus.circle")
                        .font(.custom("Avenir.bold", size: 22))
                }
            NavigationView {
                SearchExerciseLibrary()
            }
                .tag(Tab.tab3)
                .tabItem {
                    Label("Library", systemImage: "books.vertical.circle")
                        .font(.custom("Avenir.bold", size: 22))
                }
            
            AddWorkoutView()
                .tag(Tab.tab4)
                .tabItem {
                    Label("Profile", systemImage: "person")
                        .font(.custom("Avenir.bold", size: 22))
                }
        }
        .accentColor(mainColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
