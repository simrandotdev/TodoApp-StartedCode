//
//  TodosView.swift
//  TodoApp
//
//  Created by Simran Preet Narang on 2022-11-22.
//

import SwiftUI
import Combine

struct TodosView: View {
    
    @StateObject var vm = TodosViewModel()
    
    @State var todo: String = ""
    
    
    var body: some View {
        VStack {
            addTodoSection
            todosList
        }
        .navigationTitle("Todos")
    }
    
    private var addTodoSection: some View {
        Group {
            VStack {
                textField
                saveButton
            }
        }
        .padding()
    }
    
    private var todosList: some View {
        List {
            ForEach(vm.todos) { todo in
                todoItemRow(todo)
                .onTapGesture {
                    vm.updateTodo(todo)
                }
            }
            .onDelete { indexSet in
                vm.deleteTodo(indexSet)
            }
        }
        .listStyle(.plain)
    }
    
    private var saveButton: some View {
        Button {
            
            guard !todo.isEmpty else { return }
            
            vm.addTodo(title: todo)
            todo = ""
        } label: {
            Text("Save")
                .frame(maxWidth: .infinity)
                .padding(8)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(5)
        }
    }
    
    private var textField: some View {
        TextField("Enter a todo", text: $todo)
            .padding(10)
            .font(.title3)
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(Color.gray.opacity(0.2))
            }
    }
    
    private func todoItemRow(_ todo: Todo) -> some View {
        return HStack {
            Text(todo.title)
            Spacer()
            Image(systemName: todo.isComplete ? "checkmark" : "")
        }
        .contentShape(Rectangle())
    }
}

struct TodosView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TodosView()
        }
    }
}
