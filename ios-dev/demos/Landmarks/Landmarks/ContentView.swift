//
//  ContentView.swift
//  Landmarks
//
//  Created by Nathanael William on 27/03/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            //adding various views made.
            MapView()
                .frame(height: 300, alignment: .center)
                .edgesIgnoringSafeArea(.top)
            
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                    Text("Turtle Rock")
                        .font(.title)
                        .fontWeight(.medium)
                        .bold()
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    
                HStack {
                    Text("Joshua Tree National Park")
                        
                    
                    Spacer()
                    
                    Text("California")
                        
                }//HStack
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("its a rock shaped like a turtle, i assume.")
            
                
            }//VStack
            .padding()
            
            Spacer()
        }
        
    }//BodyView
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
