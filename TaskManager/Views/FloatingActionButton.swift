//
//  FloatingActionButrton.swift
//  TaskManager
//
//  Created by Alfonso Gonzalez Miramontes on 15/09/24.
//

import SwiftUI

//Example from https://www.youtube.com/watch?v=bpdhx0sB6fw


struct FloatingActionButton: View{
    
    @State private var opacityState: Double = 1
    @State private var isAlertPresented: Bool = false
    @State private var name: String = ""
    
    var buttonAction: (_ name: String) -> Void
    
    var body: some View{
        HStack{
            Spacer()
            Circle()
                .frame(width: 70, height: 70)
                .foregroundStyle(.green)
                .shadow(radius: 5)
                .overlay{
                    Image(systemName: "plus")
                        .foregroundStyle(.white)
                        .font(.title)
                }
                .opacity(opacityState)
                .onTapGesture{
                    isAlertPresented = true
                    withAnimation(.linear(duration: 0.1)){
                        opacityState = 0.2
                    }
                    withAnimation(.linear(duration: 0.1).delay(0.1)){
                        opacityState = 1
                    }
                }
        }
        .padding()
        .alert("Add Task", isPresented: $isAlertPresented){
            TextField("Task name: ", text:$name)
            Button("Cancel"){
                name = ""
            }
            Button("Save"){
                buttonAction(name)
                name = ""
            }.disabled(name.isEmpty)
        }
    }
}
