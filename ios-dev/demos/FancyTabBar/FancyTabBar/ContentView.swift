//
//  ContentView.swift
//  FancyTabBar
//
//  Created by Nathanael William on 22/03/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var index = 0
    
    var body: some View {
        VStack {
            ZStack {
                if index == 0 {
                    Color.black.opacity(0.05)
                } else if index == 1 {
                    Color.yellow
                } else if index == 2 {
                    Color.blue
                } else if index == 3 {
                    Color.orange
                }
                
                Text("Hello")
            }
            Spacer()
            CircleTab(index: $index)
        }.edgesIgnoringSafeArea(.top)
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
