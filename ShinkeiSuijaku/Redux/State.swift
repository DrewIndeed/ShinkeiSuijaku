/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Le Nguyen Truong An
  ID: s3820098
  Last modified: 29/08/2022
  Acknowledgement:
    + https://stackoverflow.com/
    + https://www.hackingwithswift.com/
    + https://www.raywenderlich.com/
    + https://github.com/
    + https://www.swiftbysundell.com/
    + https://www.chosic.com/
    + https://mixkit.co/
    + https://www.donnywals.com/
    + https://thisdevbrain.com/
*/

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
