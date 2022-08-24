//
//  ShinkeiSuijakuApp.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 18/08/2022.
//

import SwiftUI

@main
struct ShinkeiSuijakuApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(
                ShinkeiSuijakuStore(
                    initialState: ShinkeiSuijakuState(),
                    initialReducer: shinkeiSuijakuReducer
                )
            )
        }
    }
}
