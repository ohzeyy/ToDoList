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
        // purgeData() // uncomment to delete data in live preview
        loadData()
    }
    
    func toggleCompleted(toDo: ToDo) {
        // Don't try to update if toDos.id == nil (should never happen)
        guard toDo.id != nil else {return}
        
        // copy toDo (constant) into newToDo (var) so we can update the isCompleted property
        var newToDo = toDo
        newToDo.isCompleted.toggle() // flips false to true
        // Find ID for newToDo in the array of toDos, then update the element at that index with the data in newToDo
        if let index = toDos.firstIndex(where: {$0.id == newToDo.id}) {
            toDos[index] = newToDo
        }
        saveData()
    }
    
    func saveToDo(toDo: ToDo) {
        // if new, append to toDoVM.todos, else update the toDo that was passed in from the list
        if toDo.id == nil {
            var newToDo = toDo
            newToDo.id = UUID().uuidString
            toDos.append(newToDo)
        }
        else {
            if let index = toDos.firstIndex(where: {$0.id == toDo.id}) {
                toDos[index] = toDo
            }
        }
        saveData()
    }
    
    func deleteToDo(indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
        saveData()
    }
    
    func moveToDo(fromOffsets: IndexSet, toOffset: Int) {
        toDos.move(fromOffsets: fromOffsets, toOffset: toOffset)
        saveData()
    }
    
    func loadData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        guard let data = try? Data(contentsOf: path) else {return}
        do {
            toDos = try JSONDecoder().decode(Array<ToDo>.self, from: data)
        } catch {
            print("😡 ERROR: could not load data \(error.localizedDescription)")
        }
    }
    
    func saveData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        let data = try? JSONEncoder().encode(toDos) // try? means if error is thrown, data = nil
        do {
            try data?.write(to: path)
        } catch {
            print("😡 ERROR: could not save data \(error.localizedDescription)")
        }
    }
    
    func purgeData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        let data = try? JSONEncoder().encode("")
        do {
            try data?.write(to: path)
        } catch {
            print("😡 ERROR: could not save data \(error.localizedDescription)")
        }
    }
}
