//
//  TaskCategoryListView.swift
//  TaskManager
//
//  Created by Alfonso Gonzalez Miramontes on 15/09/24.
//

import SwiftUI

struct TaskCategoryListView: View{
    
    let taskCategoryResults: FetchedResults<TaskCategory>
    let onDeleteTaskCategory: (TaskCategory) -> Void
    
    var body: some View{
        List{
            if taskCategoryResults.isEmpty{
                Text("No categories to show")
            }else{
                ForEach(taskCategoryResults){taskCategory in
                    NavigationLink(value: taskCategory){
                        VStack(alignment: .leading, spacing: 15){
                            Text(taskCategory.name ?? "")
                                .font(.title)
                            Text(DateFormatter.currentDate.string(from: taskCategory.dateCreated!))
                                .font(.title2)
                                .opacity(0.5)
                        }
                    }
                }.onDelete{indexSet in
                    indexSet.map{taskCategoryResults[$0]}.forEach(onDeleteTaskCategory)
                }
            }
        }
        .navigationDestination(for: TaskCategory.self){taskCategory in
            TasksDetailsView(taskCategory: taskCategory)
        }
        .listStyle(.plain)
    }
}
