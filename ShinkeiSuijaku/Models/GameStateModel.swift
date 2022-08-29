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
//  GameStateModel.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 23/08/2022.
//

import Foundation

enum GameStateModel: String, Codable {
    case isTitle = "isTitle"
    case isMenu = "isMenu"
    case isHowToPlay = "isHowToPlay"
    case isLeaderBoard = "isLeaderBoard"
    case isGame = "isGame"
    case isWon = "isWon"
    case isLost = "isLost"
}
