//
//  Task+CoreDataClass.swift
//  TaskManager
//
//  Created by Alfonso Gonzalez Miramontes on 15/09/24.
//

import Foundation
import CoreData

@objc(UserTask)
public class UserTask: NSManagedObject{
    
    public override func awakeFromInsert(){
        self.dateCreated = Date()
    }
}
