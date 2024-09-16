//
//  TaskManagerApp.swift
//  TaskManager
//
//  Created by Alfonso Gonzalez Miramontes on 15/09/24.
//

import SwiftUI

@main
struct TaskManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
        }
    }
}
