//
//  ContentView.swift
//  spirographApp
//
//  Created by Nathanael William on 24/03/21.
//

import SwiftUI


struct Spirograph: Shape {
    
    let innerR: Int
    let outerR: Int
    let distance: Int
    let amount: CGFloat
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        
        return a
    }
    
    func path(in rect: CGRect) -> Path {
        let divisor = gcd(innerR, outerR)
        let outerR = CGFloat(self.outerR)
        let innerR = CGFloat(self.innerR)
        let distance = CGFloat(self.distance)
        let diff = innerR - outerR
        let endPoint = ceil(2 * CGFloat.pi * outerR / CGFloat(divisor)) * amount
        
        var path = Path()
        
        for theta in stride(from: 0, through: endPoint, by: 0.01) {
            var x = diff * cos(theta) + distance * cos(diff / outerR * theta)
            var y = diff * sin(theta) - distance * sin(diff / outerR * theta)
            
            x += rect.width / 2
            y += rect.height / 2
            
            if theta == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        return path
    }
    
}

struct ContentView: View {
    @State private var innerR = 125.0
    @State private var outerR = 75.0
    @State private var distance = 25.0
    @State private var amount: CGFloat = 1.0
    @State private var hue = 0.6
    
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            Spirograph(innerR: Int(innerR), outerR: Int(outerR), distance: Int(distance), amount: amount)
                .stroke(Color(hue: hue, saturation: 1, brightness: 1), lineWidth: 1)
                .frame(width: 300, height: 300)
            
            Spacer()
            
            Group {
                Text("Inner radius: \(Int(innerR))")
                Slider(value: $innerR, in: 10...150, step: 1)
                    .padding([.horizontal, .bottom])
                
                Text("Outer radius: \(Int(outerR))")
                Slider(value: $outerR, in: 10...150, step: 1)
                    .padding([.horizontal, .bottom])
                
                Text("Distance: \(Int(distance))")
                Slider(value: $distance, in: 1...150, step: 1)
                    .padding([.horizontal, .bottom])
                
                Text("Amount: \(amount, specifier: "%.2f")")
                Slider(value: $amount)
                    .padding([.horizontal, .bottom])
                
                Text("Color")
                Slider(value: $hue)
                    .padding(.horizontal)
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
