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
            ContentView().environmentObject(
                ShinkeiSuijakuStore(
                    initialState: ShinkeiSuijakuState(),
                    initialReducer: shinkeiSuijakuReducer,
                    initialMiddlewares: [gameLogic]
                )
            )
        }
    }
}
