//
//  ToDoViewModel.swift
//  ToDoList
//
//  Created by Zach Peter on 3/12/23.
//

import Foundation

class ToDoViewModel: ObservableObject {
    @Published var toDos: [ToDo] = []
    
    init() {
        // Temp data. Will eventiully load data
        toDos.append(ToDo(item: "Learn Swift"))
        toDos.append(ToDo(item: "Build Apps"))
        toDos.append(ToDo(item: "Change the World!"))
    }
}
