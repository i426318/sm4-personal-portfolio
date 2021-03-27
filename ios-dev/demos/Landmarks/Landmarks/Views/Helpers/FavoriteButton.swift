//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Nathanael William on 27/03/21.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet : Bool
    
    /*
     "Binding -> changes made inside this
     view propagate back to the data source." - Apple Devs
     */
    
    var body: some View {
        Button(action: {
            isSet.toggle()
        }) {
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(isSet ? Color.blue : Color.gray)
        }
            
        
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
