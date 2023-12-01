//
//  HomeView.swift
//  Capstone Project
//
//  Created by Avery Roth on 11/12/23.
//

import SwiftUI

struct CustomTabView: View {
    let mainColor = Color("MainColor")
    
    var body: some View {

        ZStack {
            VStack {
                TabView {

                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                                .foregroundColor(mainColor)
                                .font(.system(size: 22))
                        }

                }
            }
        }

        
//        VStack {
//            HStack {
//                ForEach(Tab.allCases, id: \.rawValue) {
//                    tab in
//                    Spacer()
//                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
//                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
//                        .foregroundColor(selectedTab == tab ? mainColor : .gray)
//                        .font(.system(size: 22))
//                        .onTapGesture {
//                            withAnimation(.easeIn(duration: 0.1)) {
//                                selectedTab = tab
//                            }
//                        }
//                    Spacer()                }
//            }
//        }
//        .frame(width: nil, height: 60)
//        .background(.thinMaterial)
//        .cornerRadius(50)
//        .padding()
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
