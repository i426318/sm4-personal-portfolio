//
//  detailedCustomTab.swift
//  duoProject
//
//  Created by Nathanael William on 10/04/21.
//

import SwiftUI

struct detailedCustomTab: View {
    
    @Binding var indexTab: Int
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.gray).opacity(0.2)
                .frame(width: 340, height: 50, alignment: .center)
            
            HStack {
                Button(action: {
                    self.indexTab = 0
                    
                }, label: {
                    if indexTab != 0 { // not chosen, ure not special.
                        Text("Description")
                            .foregroundColor(.black)
                            .font(.subheadline)
                        
                    } else { // yay wow congratz man yea
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                            Text("Description")
                                .foregroundColor(.black)
                                .font(.subheadline)
                                
                            
                        }
                        
                    }
                    
                })
                
                Spacer(minLength: 5)
                
                Button(action: {
                    self.indexTab = 1
                    
                }, label: {
                    if indexTab != 1 { // not chosen, ure not special.
                        Text("Requirements")
                            .foregroundColor(.black)
                            .font(.subheadline)
                        
                    } else { // yay wow congratz man yea
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .frame(width: 120, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                            Text("Requirements")
                                .foregroundColor(.black)
                                .font(.subheadline)
                            
                        }
                    }
                    
                })
                
                Spacer(minLength: 5)
                
                Button(action: {
                    self.indexTab = 2
                    
                }, label: {
                    if indexTab != 2 { // not chosen, ure not special.
                        Text("Personality")
                            .foregroundColor(.black)
                            .font(.subheadline)
                        
                    } else { // yay wow congratz man yea
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                
                            
                            Text("Personality")
                                .foregroundColor(.black)
                                .font(.subheadline)
                            
                        }
                    }
                    
                })
            }.padding(.horizontal, 45)
        }
    }
}

struct detailedCustomTab_Previews: PreviewProvider {
    
    static var previews: some View {
    
        
        ContentView()
    }
}
