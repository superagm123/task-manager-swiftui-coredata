//
//  TasksListView.swift
//  TaskManager
//
//  Created by Alfonso Gonzalez Miramontes on 15/09/24.
//

import SwiftUI

struct TasksDetailsView: View{
    
    let taskCategory: TaskCategory
    @Environment(\.managedObjectContext) private var viewContext
    
    private func saveTask(_ name: String){
        let newTask = UserTask(context: viewContext)
        newTask.name = name
        taskCategory.addToTasks(newTask)
        do{
            try viewContext.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    private func deleteTask(_ task: UserTask){
        viewContext.delete(task)
        do{
            try viewContext.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    var body: some View{
        ZStack{
            VStack{
                VStack{
                    HStack{
                        Text("\(taskCategory.name ?? "")-")
                            .font(.largeTitle)
                        Text(DateFormatter.currentDate.string(from: taskCategory.dateCreated!))
                            .font(.title3)
                            .opacity(0.5)
                    }
                }
                Spacer()
                TaskListView(request: TaskCategory.tasksByCategoryRequest(taskCategory)){task in
                    deleteTask(task)
                }
                FloatingActionButton{name in
                    saveTask(name)
                }
            }
        }
    }
}
