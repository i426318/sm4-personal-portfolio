//
//  ContentView.swift
//  duoProject
//
//  Created by Nathanael William on 06/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var index = 0
    
    var body: some View {
        
        
        if index == 0 {
            VStack {
                    
                    HomeView()
                    
                    Spacer()
                    
                    navigationBar(index: $index)
                
            }
        } else {
            VStack {
                Text("HELLO WORLD WRONG ADDRESS")
                
                Spacer()
                
                navigationBar(index: $index)
            }
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
