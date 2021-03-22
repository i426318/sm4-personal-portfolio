//
//  CircleTab.swift
//  FancyTabBar
//
//  Created by Nathanael William on 22/03/21.
//

import SwiftUI

struct CircleTab: View {
    
    // two-way binding.
    @Binding var index: Int
    
    var body: some View {
        HStack {
            Button(action: {
                self.index = 0
            }, label: {
                VStack {
                    if self.index != 0 {
                        Image("home").foregroundColor(.black)
                        Text("Home")
                    } else {
                        Image("home").foregroundColor(.black)
                            .padding()
                            .background(Color.blue)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        Text("Home")
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                }
            })
            
            Spacer(minLength: 5)
            
            Button(action: {
                    self.index = 1
                
            }, label: {
                VStack {
                    if self.index != 1 {
                        Image("search").foregroundColor(.black)
                        Text("Search")
                    } else {
                        Image("search").foregroundColor(.black)
                            .padding()
                            .background(Color.blue)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        Text("Search")
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                }
            })
            
            Spacer(minLength: 5)
            
            Button(action: {
                self.index = 2
            }, label: {
                VStack {
                    if self.index != 2 {
                        Image("heart").foregroundColor(.black)
                        Text("Heart")
                    } else {
                        Image("heart").foregroundColor(.black)
                            .padding()
                            .background(Color.blue)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        Text("Heart")
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                }
            })
            
            Spacer(minLength: 5)
            
            Button(action: {
                self.index = 3
            }, label: {
                VStack {
                    if self.index != 3 {
                        Image("person").foregroundColor(.black)
                        Text("Person")
                    } else {
                        Image("person").foregroundColor(.black)
                            .padding()
                            .background(Color.blue)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        Text("Person")
                            .foregroundColor(Color.black.opacity(0.7))
                    }
                }
            })
            
        }.padding(.vertical)
        .padding(.horizontal, 25)
        .background(Color.white)
        .animation(.spring())
    }
}

struct CircleTab_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
