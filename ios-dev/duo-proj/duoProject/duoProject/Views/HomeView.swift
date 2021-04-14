//
//  HomeView.swift
//  duoProject
//

// Home View (Swipe Page)

//  Created by Nathanael William on 06/04/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        VStack {
            HStack {
                Text("Your matches.")
                    .bold()
                    .font(.title2)
                
                Spacer()
                
                Image("logo") // for our logo.
                    .resizable()
                    .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            .padding(.horizontal, 25)
            
           
            
            ZStack {
                
                ForEach(Card.data.reversed()) { card in // loops cardView according to number of cards in data...
                    cardView(card: card)
                    
                }
            }
            
            
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
