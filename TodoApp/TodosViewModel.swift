//
//  TodosViewModel.swift
//  TodoApp
//
//  Created by Simran Preet Narang on 2022-11-22.
//

import Foundation
import Combine

class TodosViewModel: ObservableObject {
    
    @Published var todos: [Todo] = []
    
    private var dataStore = DataStore()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        
        fetchAllTodos()
        
        dataStore
            .$todos
            .sink { [weak self] todos in
                self?.todos = todos
            }
            .store(in: &cancellables)
    }
    
    
    func addTodo(title: String) {
        dataStore.addTodo(title: title)
    }
    
    func fetchAllTodos() {
        dataStore.fetchAllTodos()
    }
    
    func updateTodo(_ updatedTodo: Todo) {
        dataStore.updateTodo(updatedTodo)
    }
    
    func deleteTodo(_ indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        
        let todo = todos[index]
        dataStore.deleteTodo(todo)
    }
}
