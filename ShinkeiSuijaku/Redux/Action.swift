//
//  Action.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 24/08/2022.
//

import Foundation

enum Action {}

enum ShinkeiSuijakuAction {
    case startGame, newGame, leaderboard, howToPlay, logOut, giveUp
    case setDifficultyLevel(DifficultyLevelModel)
    case flipCard(UUID)
    case clearSelectedCards
    case unFlipSelectedCards
    case clearInitCards
}
