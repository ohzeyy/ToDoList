//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Zach Peter on 2/27/23.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var toDosVM = ToDoViewModel()
    
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .environmentObject(toDosVM)
        }
    }
}
