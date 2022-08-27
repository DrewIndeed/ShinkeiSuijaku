//
//  ShinkeiSuijakuApp.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 18/08/2022.
//

import SwiftUI

@main
struct ShinkeiSuijakuApp: App {
    // init Core Data manager
    @StateObject private var coreDataManager: CoreDataManager = CoreDataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(
                    \.managedObjectContext,
                     coreDataManager.persistentContainer.viewContext
                )
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
