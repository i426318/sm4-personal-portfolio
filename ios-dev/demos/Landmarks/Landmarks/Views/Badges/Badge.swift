//
//  Badge.swift
//  Landmarks
//
//  Created by Nathanael William on 05/04/21.
//

import SwiftUI

struct Badge: View {
    static let rotationCount = 8
    
    var badgeSymbols: some View {
        ForEach(0..<Badge.rotationCount) { i in
            RotatedBadgeSymbol( // very interesting math.
                angle: .degrees(Double(i) / Double(Badge.rotationCount)) * 360
            )
        }
        .opacity(1)
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            GeometryReader {
                geometry in
                    badgeSymbols
                        .scaleEffect(1.0 / 4.0, anchor: .top)
                        .position(x: geometry.size.width/2.0, y:(3.0/4.0) * geometry.size.height)
                
            }
            
        }
        .scaledToFit()
        
    
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}