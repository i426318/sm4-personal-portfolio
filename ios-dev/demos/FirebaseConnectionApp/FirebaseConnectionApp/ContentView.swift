//
//  ContentView.swift
//  FirebaseConnectionApp
//
//  Created by Nathanael William on 12/04/21.
//

// following CRUD tutorials - Create, Read, Update, Delete

import SwiftUI
import Firebase
//import FirebaseFirestore


struct ContentView: View {
    
    @State var name = ""
    @State var gender = ""
    @State var age = ""
    
    var body: some View {
        VStack {
            TextField("Enter your name", text: $name)
                .padding()
            TextField("Enter your gender", text: $gender)
                .padding()
            TextField("Enter your age", text: $age)
                .padding()
            
            Divider()
                .padding(.horizontal, 25)
            
            ScrollView {
                Text("this'll be the scrollview.")
            }.frame(width: UIScreen.main.bounds.size.width, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(.horizontal, 25)
            
            Button(action: {
                let ratingDictionary = [
                    "name": self.name,
                    "gender": self.gender,
                    "age": self.age
                    
                ] // creates set of data to be collected.
                
                // let docRef = Firestore.
                
                
            }, label: {
                Text("Add Rating")
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
