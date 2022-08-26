//
//  State.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 23/08/2022.
//

import Foundation

struct State {}

struct ShinkeiSuijakuState: Codable {
    var cards: [CardModel] = []
    var selectedCards: [CardModel] = []
    var moves: Int = 0
    var gameState: GameStateModel = .isTitle
    var difficultyLevel: DifficultyLevelModel = .easy
}
