//
//  ContentView.swift
//  TaskManager
//
//  Created by Alfonso Gonzalez Miramontes on 15/09/24.
//

import SwiftUI


struct ContentView: View{
    
    @State private var isAlertPresented: Bool = false
    @State private var name: String = ""
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(fetchRequest: TaskCategory.allCategories) var taskCategoryResults
    
    private func saveTaskCategory(){
        do{
            let taskCategory = TaskCategory(context: viewContext)
            taskCategory.name = name
            try viewContext.save()
            name = ""
        }catch{
            print(error.localizedDescription)
        }
    }
    
    private func deleteTaskCategory(_ taskCategory: TaskCategory){
        viewContext.delete(taskCategory)
        do{
            try viewContext.save()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    var body: some View{
        NavigationStack{
            VStack(spacing: 25){
                Text("Categories: \(taskCategoryResults.count)")
                    .font(.title2)
                    .foregroundStyle(.green)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                TaskCategoryListView(taskCategoryResults: taskCategoryResults){taskCategory in
                    deleteTaskCategory(taskCategory)
                }
            }
            .padding()
            .navigationTitle("Task Manager")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button(action: {
                        isAlertPresented = true
                    }){
                        Image(systemName: "plus")
                            .foregroundStyle(.green)
                            .font(.title2)
                    }.alert("Add Category",isPresented: $isAlertPresented){
                        TextField("Category Name:", text: $name)
                        Button("Cancel"){
                            name = ""
                        }
                        Button("Save"){
                            saveTaskCategory()
                        }.disabled(name.isEmpty)
                    }
                }
            }
        }
    }
}


#Preview{
    ContentView()
        .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
}
