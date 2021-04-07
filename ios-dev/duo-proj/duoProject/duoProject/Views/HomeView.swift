//
//  HomeView.swift
//  duoProject
//
//  Created by Nathanael William on 06/04/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        VStack {
            HStack {
                Text("Your Job Matches")
                    .bold()
                    .font(.system(size: 25))
                
                Spacer()
                
                Image(systemName: "sun.min") // for our logo.
            }
            .padding(.horizontal, 55)
            .padding(.top, 25)
           
            
            ZStack {
                
                cardView()
            }
            
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}