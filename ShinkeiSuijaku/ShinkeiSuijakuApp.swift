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
