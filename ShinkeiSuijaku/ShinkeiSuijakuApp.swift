//
//  ShinkeiSuijakuApp.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 18/08/2022.
//

import SwiftUI

@main
struct ShinkeiSuijakuApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
