//
//  TaskListView.swift
//  TaskManager
//
//  Created by Alfonso Gonzalez Miramontes on 15/09/24.
//

import SwiftUI
import CoreData

struct TaskListView: View{
    @FetchRequest var tasksResults: FetchedResults<UserTask>
    @State private var search: String = ""
    
    let onDeleteTask: (UserTask) -> Void
    
    init(request: NSFetchRequest<UserTask>, onDeleteTask: @escaping (UserTask) -> Void){
        _tasksResults = FetchRequest(fetchRequest: request)
        self.onDeleteTask = onDeleteTask
    }
    
    var body: some View{
        if tasksResults.isEmpty{
            Text("No tasks to show.")
        }else{
            VStack{
                Text("Tasks: \(tasksResults.count)")
                    .foregroundStyle(.green)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                List{
                    ForEach(tasksResults){task in
                        HStack{
                            Text(task.name ?? "")
                            Spacer()
                            Text(DateFormatter.currentDate.string(from: task.dateCreated!))
                        }
                    }.onDelete{indexSet in
                        indexSet.map{tasksResults[$0]}.forEach(onDeleteTask)
                    }
                }
                .listStyle(.plain)
            }.padding()
        }
    }
}
