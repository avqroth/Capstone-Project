//
//  HomeView.swift
//  Capstone Project
//
//  Created by Avery Roth on 11/12/23.
//

import SwiftUI

struct HomeView: View {
    
    
    var body: some View {
        TabView {
            Text("Home")
                .tabItem {
                    Image(systemName: "1.house")
                    Text("Tab 1")
                }
                .tag(0)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
