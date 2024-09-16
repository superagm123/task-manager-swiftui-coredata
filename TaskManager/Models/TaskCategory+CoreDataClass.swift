//
//  TaskCategory.swift
//  TaskManager
//
//  Created by Alfonso Gonzalez Miramontes on 15/09/24.
//

import Foundation
import CoreData

@objc(TaskCategory)
public class TaskCategory: NSManagedObject{
    
    public override func awakeFromInsert(){
        self.dateCreated = Date()
    }
    
    static var allCategories: NSFetchRequest<TaskCategory>{
        let request = TaskCategory.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key:"dateCreated", ascending: false)]
        return request
    }
    
    static func tasksByCategoryRequest(_ taskCategory: TaskCategory) -> NSFetchRequest<UserTask>{
        let request = UserTask.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "dateCreated", ascending: false)]
        request.predicate = NSPredicate(format: "category = %@", taskCategory)
        return request
    }
    
}
