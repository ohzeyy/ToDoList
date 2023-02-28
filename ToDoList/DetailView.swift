//
//  DetailView.swift
//  ToDoList
//
//  Created by Zach Peter on 2/27/23.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var toDo = ""
    @State private var reminderIsOn = false
    @State private var dueDate = Date.now + (60*60*24)
    @State private var notes = ""
    @State private var isCompleted = false
    
    var passedValue: String
    
    var body: some View {
        NavigationStack {
            List {
                
                
                TextField("Enter To-Do here", text: $toDo)
                    .font(.title)
                    .textFieldStyle(.roundedBorder)
                    .padding(.vertical)
                    .listRowSeparator(.hidden)
                
                Toggle("Set Reminder:", isOn: $reminderIsOn)
                    .padding(.top)
                    .listRowSeparator(.hidden)
                DatePicker("Date", selection: $dueDate)
                    .listRowSeparator(.hidden)
                    .padding(.bottom)
                    .disabled(!reminderIsOn)
                
                Text("Notes")
                    .padding(.top)
                
                TextField("Notes", text: $notes, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .listRowSeparator(.hidden)
                
                Toggle("Completed:", isOn: $isCompleted)
                    .padding(.top)
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        // TODO: add save code
                        
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(passedValue: "Item 1")
    }
}
