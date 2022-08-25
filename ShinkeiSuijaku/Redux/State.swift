//
//  State.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 23/08/2022.
//

import Foundation

struct State {}

struct ShinkeiSuijakuState {
    var gameState: GameState = .isTitle
    var cards: [CardModel] = []
    var selectedCards: [CardModel] = []
    var moves: Int = 0
}
