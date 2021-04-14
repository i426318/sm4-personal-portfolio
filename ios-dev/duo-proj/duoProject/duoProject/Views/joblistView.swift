//
//  joblistView.swift
//  duoProject
//
//  Created by Nathanael William on 14/04/21.
//

import SwiftUI

struct joblistView: View {
    
    @State var indexTab = 0
    var body: some View {
    
        
        VStack {
          
            HStack {
                
            Text("Your job applications.")
                .font(.title2)
                .bold()
                
                Spacer()
                
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
            }.padding(.horizontal, 25)
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.gray).opacity(0.2)
                    .frame(width: 380, height: 50, alignment: .center)
                
                HStack {
                    Button(action: {
                        self.indexTab = 0
                        
                    }, label: {
                        if indexTab != 0 { // not chosen, ure not special.
                            Text("Favorites")
                                .foregroundColor(.black)
                                .font(.subheadline)
                            
                        } else { // yay wow congratz man yea
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                
                                Text("Favorites")
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
                            Text("In Progress")
                                .foregroundColor(.black)
                                .font(.subheadline)
                            
                        } else { // yay wow congratz man yea
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .frame(width: 120, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                
                                Text("In Progress")
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
                            Text("Accepted")
                                .foregroundColor(.black)
                                .font(.subheadline)
                            
                        } else { // yay wow congratz man yea
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    
                                
                                Text("Accepted")
                                    .foregroundColor(.black)
                                    .font(.subheadline)
                                
                            }
                        }
                        
                    })
                    
                    
                    Spacer(minLength: 5)
                    
                    Button(action: {
                        self.indexTab = 3
                        
                    }, label: {
                        if indexTab != 3 { // not chosen, ure not special.
                            Text("Rejected")
                                .foregroundColor(.black)
                                .font(.subheadline)
                            
                        } else { // yay wow congratz man yea
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    
                                
                                Text("Rejected")
                                    .foregroundColor(.black)
                                    .font(.subheadline)
                                
                            }
                        }
                        
                    })
                }.padding(.horizontal, 15)
            } // end of button option
            
            Spacer()
            
                Text("poggers")
            
            
        }
        
        
        }


struct joblistView_Previews: PreviewProvider {
    static var previews: some View {
        joblistView()
    }
}
    
}
