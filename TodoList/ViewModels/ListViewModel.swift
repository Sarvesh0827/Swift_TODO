//
//  ListViewModel.swift
//  TodoList
//
//  Created by Sarvesh Reshimwale on 24/07/24.
//

import Foundation


/*
 CRUD FUNCTIONS
 CREATE
 READ
 UPDATE
 DELETE
 */

class ListViewModel : ObservableObject{
    @Published var items : [ItemModel] = []{
        didSet{
            //if anytime change is made to ItemModel then this func is executed
            saveItems()
        }
    }
    let itemsKey : String = "items_key"
    
    init(){
        getItems()
    }
    
    func getItems (){
//        let newItems = [
//            ItemModel(title: "This is first title", isCompleted: false),
//            ItemModel(title: "This is second title", isCompleted: true),
//            ItemModel(title: "This is third title", isCompleted: false)
//        ]
//        items.append(contentsOf: newItems)
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else{
            return
        }
        
        self.items = savedItems
    }
    
    func deleteItem (indexSet:IndexSet){
        items.remove(atOffsets:indexSet)
    }
    
    func moveItem(from : IndexSet ,to:Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem (title : String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    
    //User Defaults
//    Now we will Convert the ItemModels Data to json format for storage of current state so Its not lost when we refresh our simulator
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData,forKey:itemsKey)
        }
    }
    
    
}
