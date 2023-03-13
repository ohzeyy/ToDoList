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
    
    func saveToDo(toDo: ToDo, newToDo: Bool) {
        // if new, append to toDoVM.todos, else update the toDo that was passed in from the list
        if newToDo {
            toDos.append(toDo)
        }
        
        else {
            if let index = toDos.firstIndex(where: {$0.id == toDo.id}) {
                toDos[index] = toDo
            }
        }
    }
    
    func delete(indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
    }
    
    func move(fromOffsets: IndexSet, toOffset: Int) {
        toDos.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
    
    
}
