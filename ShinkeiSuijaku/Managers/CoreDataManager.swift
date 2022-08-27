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
