//
//  BadgeSymbol.swift
//  Landmarks
//
//  Created by Nathanael William on 05/04/21.
//

import SwiftUI

struct BadgeSymbol: View {
    
    static let symbolColor = Color(red: 255 / 255, green: 255 / 255, blue: 191.0 / 255)
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75
                let spacing = width * 0.030
                let middle = width * 0.5
                let topWidth = width * 0.226
                let topHeight = height * 0.488
                
                path.addLines([ // top triangle
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing),
                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: spacing)
                ])
                
                path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3)) // move to add bottom triangle
                
                path.addLines([ // bot triangle
                    CGPoint(x: middle - topWidth, y: topHeight + spacing),
                    CGPoint(x: spacing, y: height - spacing),
                    CGPoint(x: width - spacing, y: height - spacing),
                    CGPoint(x: middle + topWidth, y: topHeight + spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
                
                ])
            }
            .fill(Self.symbolColor)
            
        }
    }
}

struct BadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        BadgeSymbol()
    }
}
