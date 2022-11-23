//
//  Todo.swift
//  TodoApp
//
//  Created by Simran Preet Narang on 2022-11-22.
//

import Foundation

struct Todo: Codable, Identifiable {
    
    var id: String
    var title: String
    var isComplete: Bool
}
