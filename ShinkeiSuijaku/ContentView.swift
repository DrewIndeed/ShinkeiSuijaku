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
//  ContentView.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 23/08/2022.
//

import SwiftUI

struct ContentView: View {
    // (Redux) store as an environment object to be able to update
    @EnvironmentObject var store: ShinkeiSuijakuStore
    
    // render screens depending on game (Redux) state
    var body: some View {
        switch store.state.gameState {
        case .isTitle:
            TitleScreenView()
        case .isMenu:
            MenuScreenView()
        case .isHowToPlay:
            HowToPlayScreenView()
        case .isLeaderBoard:
            Text("In Leaderboard")
        case .isGame:
            GameScreenView()
        case .isWon:
            WonScreenView()
        case .isLost:
            LostScreenView()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {        
        VStack {
            ContentView()
                .environmentObject(
                    ShinkeiSuijakuStore(
                        initialState: ShinkeiSuijakuState(),
                        initialReducer: shinkeiSuijakuReducer,
                        initialMiddlewares: [gameLogic]
                    )
                )
        }
    }
}
