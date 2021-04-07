//
//  navigationBar.swift
//  duoProject
//
//  Created by Nathanael William on 06/04/21.
//

import SwiftUI

struct navigationBar: View {
    
    @Binding var index: Int // index for swapping buttons, binded.
    
    var body: some View {
        
        
        // colors.
        let bgColor = Color.white
        let symbolColor = Color.black
        let symbolColorSelect = Color.white
        
        HStack {
            
            Button(action: {
                self.index = 0
                
            }, label: {
                VStack {
                    if self.index != 0 {
                        Image(systemName: "person.fill")
                            .font(.system(size: 25))
                        
                        Text("PROFILE")
                            .font(.system(size: 12))
                            .bold()
                    } else {
                        Image(systemName: "person.fill")
                            .font(.system(size: 30))
                            .padding()
                            .background(symbolColorSelect)
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, y: 20)
                        
                        Text("PROFILE")
                            .font(.system(size: 12))
                            .bold()
                        
                    }
                    
                }
                
                
            })
            
            Spacer(minLength: 5)
            
            Button(action: {
                self.index = 1
            }, label: {
                VStack {
                    if self.index != 1 {
                        Image(systemName: "briefcase.fill")
                            .font(.system(size: 25))
                        
                        Text("JOBLIST")
                            .font(.system(size: 12))
                            .bold()
                    } else {
                        Image(systemName: "briefcase.fill")
                            .font(.system(size: 30))
                            .padding()
                            .background(symbolColorSelect)
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, y: 20)
                        
                        Text("JOBLIST")
                            .font(.system(size: 12))
                            .bold()
                    }
                    
                }
                
                
            })
            
            Spacer(minLength: 5)
            
            Button(action: {
                self.index = 2
            }, label: {
                VStack {
                    if self.index != 2 {
                        Image(systemName: "hand.draw.fill")
                            .font(.system(size: 25))
                        
                        Text("SWIPE")
                            .font(.system(size: 12))
                            .bold()
                        
                    } else {
                        Image(systemName: "hand.draw.fill")
                            .font(.system(size: 30))
                            .padding()
                            .background(symbolColorSelect)
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, y: 20)
                        
                        Text("SWIPE")
                            .font(.system(size: 12))
                            .bold()
                    }
                    
                    
                    
                }
                
                
            })
            
            Spacer(minLength: 5)
            
            Button(action: {
                self.index = 3
                
            }, label: {
                VStack {
                    if self.index != 3 {
                        Image(systemName: "bubble.left.and.bubble.right.fill")
                            .font(.system(size: 25))
                        
                        Text("NETWORK")
                            .font(.system(size: 12))
                            .bold()
                        
                    } else {
                        Image(systemName: "bubble.left.and.bubble.right.fill")
                            .font(.system(size: 30))
                            .padding()
                            .background(symbolColorSelect)
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, y: 20)
                        
                        Text("NETWORK")
                            .font(.system(size: 12))
                            .bold()
                        
                    }
                    
                }
                
                
            })
            
            
            
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 20)
        .background(bgColor)
        .foregroundColor(symbolColor)
        
        
    }
}

struct navigationBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
