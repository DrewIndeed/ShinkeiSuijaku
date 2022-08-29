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
//  CoreDataManager.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 26/08/2022.
//

import Foundation
import CoreData

class CoreDataManager: ObservableObject {
    // this is to refer to our Data Model file
    let persistentContainer: NSPersistentContainer = NSPersistentContainer(name: "ShinkeiSuijaku")
    
    // to load data from the file + catch error
    init() {
        persistentContainer.loadPersistentStores {(description, error) in
            if let error = error {
                print("[ERROR - CoreDataManager failed to load] msg: \(error.localizedDescription)")
            }
        }
    }
}
