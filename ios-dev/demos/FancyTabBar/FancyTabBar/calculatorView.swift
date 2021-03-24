//
//  calculatorView.swift
//  FancyTabBar
//
//  Created by Nathanael William on 24/03/21.
//

import SwiftUI

struct calculatorView: View {
    
    @State private var input1: String = ""
    @State private var input2: String = ""
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Form {
                Section {
                    Text("Calculator")
                        .bold()
                        .font(.system(size: 30))
                }
                Section {
                   
                    TextField("First Number...", text: $input1)

                        .keyboardType(.decimalPad)
                        .font(.system(size: 20))
                        .padding(.top)
                    
                    TextField("Second Number...", text: $input2)
                        
                        .keyboardType(.decimalPad)
                        .font(.system(size: 20))
                        .padding(.bottom)
                }
                
                Button(action: {
                    
                }, label: {
                    Text("Add")
                })
                Button(action: {
                    
                }, label: {
                    Text("Subtract")
                })
                
            }
        }
        
        
        
    }
}


struct calculatorView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
