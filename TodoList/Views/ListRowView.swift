//
//  ListRowView.swift
//  TodoList
//
//  Created by Sarvesh Reshimwale on 23/07/24.
//

import SwiftUI

struct ListRowView: View {
    
    let item : ItemModel
    
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
                
            Text(item.title)
            Spacer()
        }.font(.title2).padding(.vertical,8)
        
    }
}


struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "Item1", isCompleted: false)
    static var item2 = ItemModel(title: "Item2", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
