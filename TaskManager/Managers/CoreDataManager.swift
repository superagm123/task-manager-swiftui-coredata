//
//  CoreDataManager.swift
//  TaskManager
//
//  Created by Alfonso Gonzalez Miramontes on 15/09/24.
//

import Foundation
import CoreData


class CoreDataManager{
    static var shared = CoreDataManager()
    private var persistentContainer: NSPersistentContainer
    
    private init(){
        persistentContainer = NSPersistentContainer(name:"TaskManagerModel")
        persistentContainer.loadPersistentStores{description, error in
            if let error{
                fatalError("Unable to initialize core data. \(error)")
            }
        }
    }
    
    var viewContext: NSManagedObjectContext{
        persistentContainer.viewContext
    }
}
