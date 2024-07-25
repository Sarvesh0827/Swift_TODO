//
//  ItemModel.swift
//  TodoList
//
//  Created by Sarvesh Reshimwale on 23/07/24.
//

import Foundation

//This kind of struct is Immutable Struct

struct ItemModel : Identifiable,Codable {
    // Identifiable is used above to
//    Protocol Conformance: : Identifiable
//
//    The Identifiable protocol requires a type to have a unique identifier. This is useful in SwiftUI, especially when working with lists, to uniquely identify each element.
    let id : String
    let title : String
    let isCompleted : Bool
    
    
    init(title: String, isCompleted: Bool , id : String = UUID().uuidString) {
        self.title = title
        self.isCompleted = isCompleted
        self.id = id
    }
    
    func updateCompletion()->ItemModel{
        return ItemModel(title: title, isCompleted: !isCompleted, id: id)
    }
}






//if we want to use this model in ForEach Loop then we must use Identifiable for unique id refrence
