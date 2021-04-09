//
//  ContentView.swift
//  duoProject
//
//  Created by Nathanael William on 06/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var index = 2
    
    var body: some View {
        
        
        if index == 0 { // profile page.
            VStack {
                    
                    Text("PROFILE PAGE")
                    
                    Spacer()
                    
                    navigationBar(index: $index)
                
            }
        } else if index == 1 { // joblist page.
            VStack {
                Text("JOBLIST PAGE")
                
                Spacer()
                
                navigationBar(index: $index)
            }
            
        } else if index == 2 { // swipe page.
            VStack {
                HomeView()
                
                Spacer()
                
                navigationBar(index: $index)
            }
            
        } else if index == 3 { // network page.
            VStack {
                Text("NETWORK PAGE")
                
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
