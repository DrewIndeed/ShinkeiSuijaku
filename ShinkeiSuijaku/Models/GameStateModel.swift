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
