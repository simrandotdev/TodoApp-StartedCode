//
//  DataStore.swift
//  TodoApp
//
//  Created by Simran Preet Narang on 2022-11-22.
//

import Foundation

class DataStore {
    
    @Published var todos: [Todo] = [] {
        didSet {
            print("Todos Updated")
        }
    }
    
    func addTodo(title: String) {
        let todo = Todo(id: UUID().uuidString, title:title, isComplete: false)
        todos.append(todo)
    }
    
    func fetchAllTodos() {
        todos = (0..<10)
            .map({
                Todo(id: UUID().uuidString, title: "Title \($0)", isComplete: false)
            })
    }
    
    func updateTodo(_ updatedTodo: Todo) {
        let indexToUpdate = todos.firstIndex { $0.id == updatedTodo.id }
       
        guard let indexToUpdate else { return }
        
        var todo = updatedTodo
        todo.isComplete.toggle()
        todos[indexToUpdate] = todo
    }
    
    func deleteTodo(_ todo: Todo) {
        let indexToDelete = todos.firstIndex { $0.id == todo.id }
        guard let indexToDelete else { return }
        todos.remove(at: indexToDelete)
    }
}
