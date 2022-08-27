//
//  PlayerDataHandler.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 27/08/2022.
//

import Foundation
import SwiftUI

func checkForDuplicates(targetPlayerName: String, players: FetchedResults<Player>) -> Bool {
    for player in players {
        if (player.name == targetPlayerName){
            return true
        }
    }
    return false
}

func updateStatus(targetPlayerName: String, players: FetchedResults<Player>) {
    for player in players {
        if (player.name == targetPlayerName){
            player.isPlaying = true
        } else {
            player.isPlaying = false
        }
    }
}
