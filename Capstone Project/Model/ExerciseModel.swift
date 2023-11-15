//
//  ProductModel.swift
//  Capstone Project
//
//  Created by Avery Roth on 11/12/23.
//

import Foundation


class ExerciseModel: Codable, ObservableObject {
    var id: UUID = UUID()
    let count: Int
    let entries: [ExerciseEntries]
    
}

class ExerciseEntries: Codable, Identifiable, ObservableObject {
    var id: Int
    var name: String
    let type: String
    let muscle: String
    let equipment: String
    let difficulty: String
    let instructions: String
    
    enum Codingkeys: String, CodingKey {
        case name = "Name"
        case type = "Type"
        case muscle = "Muscle"
        case equipment = "Equipment"
        case difficulty = "Difficulty"
        case instructions = "Instructions"
    }
    
}
