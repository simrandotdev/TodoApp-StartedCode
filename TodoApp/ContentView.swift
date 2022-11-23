//
//  ContentView.swift
//  TodoApp
//
//  Created by Simran Preet Narang on 2022-11-22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TodosView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
