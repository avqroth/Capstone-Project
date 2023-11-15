//
//  LibraryView.swift
//  Capstone Project
//
//  Created by Avery Roth on 11/14/23.
//

import SwiftUI

struct LibraryView: View {
    @ObservedObject var exerciseStore = ExerciseStore()
    @State var searchText = ""
    
    var body: some View {
        NavigationView() {
            
        }
    }
}

struct SearchView: View {
    @ObservedObject var exerciseStore: ExerciseStore
    @State var searchText = ""
    
    var body: some View {
        NavigationView() {
            VStack {
                TextField("Search", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .onSubmit {
                        Task {
                            try await exerciseStore.searchExerciseEntries(query: searchText)
                        }
                    }
                ScrollView {
                    ForEach(exerciseStore.exerciseModel.entries, id: \.id) { entries in
                        NavigationLink(destination: ExerciseDetailView(entry: entries, exerciseModel: ExerciseModel)) {
                            Text(entries.name)
                                .padding()
                        }
                    }
                }
            }
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
