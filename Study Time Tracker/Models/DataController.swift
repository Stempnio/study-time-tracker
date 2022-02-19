//
//  DataController.swift
//  Study Time Tracker
//
//  Created by Jakub Stepien on 19/02/2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
//    lazy var persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "CoreDataModel")
//        container.loadPersistentStores { description, error in
//            if let error = error {
//                fatalError("Unable to load persistent stores: \(error)")
//            }
//        }
//        return container
//    }()
    
    let container = NSPersistentContainer(name: "CoreDataModel")

    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("core data failed to load \(error.localizedDescription)")
            }
        }
    }
}
