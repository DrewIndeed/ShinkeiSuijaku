//
//  Reducer.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 24/08/2022.
//

import Foundation

typealias Reducer<State, Action> = (State, Action) -> State

let shinkeiSuijakuReducer: Reducer<ShinkeiSuijakuState, ShinkeiSuijakuAction> = { state, action in
    // mutable copy of the current state (Redux's way to change the state)
    var mutatingState = state
    
    // change the state depending on action requests
    // more action, more cases
    switch action {
    case .startGame:
        mutatingState.gameState = .isMenu
    case .newGame:
        mutatingState.gameState = .isGame
    case .leaderboard:
        mutatingState.gameState = .isLeaderBoard
    case .howToPlay:
        mutatingState.gameState = .isHowToPlay
    case .logOut:
        mutatingState.gameState = .isTitle
    }
    
    // return newly updated state
    return mutatingState
}
