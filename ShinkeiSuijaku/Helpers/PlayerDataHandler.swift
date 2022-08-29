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
