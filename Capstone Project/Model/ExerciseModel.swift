//
//  ProductModel.swift
//  Capstone Project
//
//  Created by Avery Roth on 11/12/23.
//

import Foundation


class ExerciseModel: Codable, ObservableObject, Identifiable {
    var id: UUID = UUID()
    let count: Int
    let exercises: [ExerciseEntry]

}

class ExerciseEntry: Codable, Identifiable {
    var id: Int?
    let name: String
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

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(String.self, forKey: .type)
        self.muscle = try container.decode(String.self, forKey: .muscle)
        self.equipment = try container.decode(String.self, forKey: .equipment)
        self.difficulty = try container.decode(String.self, forKey: .difficulty)
        self.instructions = try container.decode(String.self, forKey: .instructions)
    }
}
