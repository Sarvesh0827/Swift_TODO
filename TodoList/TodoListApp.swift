//
//  TodoListApp.swift
//  TodoList
//
//  Created by Sarvesh Reshimwale on 23/07/24.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
