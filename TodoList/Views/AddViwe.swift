//
//  AddViwe.swift
//  TodoList
//
//  Created by Sarvesh Reshimwale on 23/07/24.
//
import SwiftUI

struct AddViwe: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type Something Here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(uiColor: .systemGray6))
                    .cornerRadius(10)
                
                Button(action: {
                    saveButtonPress()
                }, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(16)
        }
        .navigationTitle("Add new Item 🖊️")
        .alert(isPresented: $showAlert, content: {
            getAlert()
        })
    }
    
    func saveButtonPress() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new ToDo List title must be at least 3 characters long. 🥶"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView {
        AddViwe()
    }.environmentObject(ListViewModel())
}




//import SwiftUI
//
//struct AddViwe: View {
//    @Environment(\.presentationMode) var presentationMode
//    @EnvironmentObject var listViewModel : ListViewModel
//    
//    @State var alertTitle : String = ""
//    @State var showAlert : Bool = false
//    @State var textFieldText : String = ""
//    
//    var body: some View {
//        ScrollView{
//            VStack {
//                TextField("Type Something Here...",text: $textFieldText )
//                    .padding(.horizontal)
//                    .frame(height: 55)
//                    .background(Color(uiColor: .systemGray6))
//                .cornerRadius(10)
//                
//                Button(action: {
//                    saveButtonPress()
//                    
//                } , label: {
//                    Text("Save".uppercased())
//                        .foregroundColor(.white)
//                        .font(.headline)
//                        .frame(height: 55)
//                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
//                        .background(Color.accentColor)
//                        .cornerRadius(10)
//                })
//            }
//            .padding(16)
//            
//        }
//        .navigationTitle("Add new Item 🖊️ ")
//        .alert(isPresented: $showAlert, content: {
//            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Alert(title: Text("Alert"))/*@END_MENU_TOKEN@*/
//        })
//        
//    }
//    
//    func saveButtonPress(){
//        if textIsAppropriate(){
//            listViewModel.addItem(title: textFieldText)
//            presentationMode.wrappedValue.dismiss()
//        }
//        
//        
//    }
//    
//    func textIsAppropriate() -> Bool {
//        if textFieldText.count<3{
//            alertTitle = "Your new ToDo List title must be 3 char Long"
//            showAlert.toggle()
//            return false
//        }
//        return true
//    }
//    
//    func getAlert ()-> Alert {
//        return Alert(title: Text(alertTitle))
//    }
//}
//
//#Preview {
//    NavigationView{
//        AddViwe()
//    }.environmentObject(ListViewModel())
//}
