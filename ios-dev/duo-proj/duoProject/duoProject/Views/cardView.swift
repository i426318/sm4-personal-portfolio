//
//  cardView.swift
//  duoProject
//
//  Created by Nathanael William on 07/04/21.
//

import SwiftUI

struct cardView: View {
    
    @State var card: Card // calls the card data.
    @State var isModal = false
    
    
    
    var body: some View {
        
        let txtSubColor = Color.init(red: 135/255, green: 135/255, blue: 135/255)
        let bgColor = Color.init(red: 255/255, green: 255/255, blue: 250/255)
        
        
            ZStack {
                
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                  .foregroundColor(bgColor)
                  .padding()
                  .shadow(radius: 15)
                    
                
                VStack {
                    Image(card.imageName)
                        .resizable()// image of company.
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.blue)
                        .font(.system(size: 100))
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 7)
                        .padding(.bottom, 5)
                    
                    Text(card.jobPosition) // job title.
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    
                    Text(card.companyName) // companyName.
                            .padding(.top, 1)
                            .font(.system(size: 20))
                        
                    Text(card.companyLocation) // location.
                    
                    .font(.subheadline)
                    .foregroundColor(txtSubColor)
                    .padding(.horizontal, 25)
                   
                    
                    Divider().padding(.horizontal, 65)
                    
                    Text("Compatibility")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .padding(.bottom, 10)
                        .padding(.top, 10)
                    
                    
                    HStack {
                        VStack { // SALARY
                            Text(card.salary) // salary values.
                                .padding(.bottom, 10)
                            
                            Text("Salary")
                                
                            
                            Image(systemName: "dollarsign.circle")
                            
                        }.font(.system(size: 14))
                        
                        Spacer(minLength: 5)
                       
                        VStack { // EXPERIENCE
                            
                            Text(card.experience) // exp values.
                                .padding(.bottom, 10)
                            
                            Text("Experience")
                            Image(systemName: "person.3")
                            
                        }.font(.system(size: 14))
                        
                        
                        Spacer(minLength: 5)
                        
                        VStack { // LOCATION
                            
                            Text(String(card.location) + " km") // loc values.
                                .padding(.bottom, 10)
                            
                            Text("Location")
                            Image(systemName: "mappin.circle")
                            
                        }.font(.system(size: 14))
                        
                        
                        
                    }
                    .padding(.horizontal, 50)
                    .padding(.vertical)
                
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blue)
                            .frame(width: 120, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                       
                        Button(action: {
                            // toggles modalView of the chosen data.
                            self.isModal.toggle()
                            
                        }, label: {
                                
                                Text("More Info")
                                    .foregroundColor(.white)
                                    .bold()
                            
                        })
                    }.padding(.top, 20)
                    .sheet(isPresented:$isModal, content: {
                        
                        // shows detailed view according to company id
                        cardDetailedView(card: card)
                        
                    })
                    
                    
                }
                
                
            }
            // zstack following the coordinates of the card model
            .offset(x: card.x, y: card.y)
            .rotationEffect(.init(degrees: card.degree))
        
            // gesture -> updates the coordinate vals of the card model
            .gesture(
            
                DragGesture()
                    .onChanged { value in
                        // user is dragging the view
                        withAnimation(.default) { // default animation
                            card.x = value.translation.width
                            card.y = value.translation.height
                            card.degree = 7 * (value.translation.width > 0 ? 1 : -1)
                        }
                    }
                    .onEnded { value in
                        /* does something when user stops dragging.
                           add 3-way cases ->
                         1. slightly left = nope
                         2. middle = clickback (neutral)
                         3. slightly right = yes
                        */
                        withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 75, damping: 10, initialVelocity: 0)) { // springs back animation.
                            
                            switch value.translation.width {
                            
                            // 1. if x value is slight right
                            case 0...100:
                                card.x = 0; card.degree = 0; card.y = 0
                                
                            // 2. if x value is right++
                            case let x where x > 100:
                                card.x = 500; card.degree = 12
                                
                            // 3. if x value is slight left
                            case (-100)...(-1):
                                card.x = 0; card.degree = 0; card.y = 0
                                
                            // 4. if x value is left++
                            case let x where x < -100:
                                card.x = -500; card.degree = -12
                            
                            // default scenario (normal state)
                            default: card.x = 0; card.y = 0
                            }
                        }
                    }
            
            
            )
        
        
    }
}


// CARD DETAILS STRUCT :D :D :'D

struct cardDetailedView: View {
    
    @State var card: Card // calls the card data.
    
    @State private var indexTab = 0
    
    var body: some View {
        
        ScrollView(.vertical) {
        VStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(Color.gray).opacity(0.6)
                .frame(height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.horizontal, 150)
                .padding(.vertical, 10)
            
            Spacer(minLength: 5)
            
            VStack {
                Image(systemName: "signature") // image of company.
                    .foregroundColor(.blue)
                    .font(.system(size: 100))
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 7)
                    .padding(.bottom, 5)
                
                Text(card.jobPosition) // job title.
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                
                Text(card.companyName) // companyName.
                        .padding(.top, 1)
                        .font(.system(size: 20))
                    
                Text(card.companyLocation) // location.
                
                .font(.subheadline)
                    .foregroundColor(.gray)
                .padding(.horizontal, 25)
                
               
                
                Divider().padding(.horizontal, 65)
                
            
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.yellow)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        
                        VStack { // SALARY
                            Text(card.salary) // salary values.
                                .padding(.bottom, 10)
                            
                            Text("Salary")
                                
                            
                            Image(systemName: "dollarsign.circle")
                            
                        }.font(.system(size: 14))
                    }
                    
                    
                    Spacer(minLength: 5)
                   
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.green)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            
                            .opacity(0.5)
                        
                        VStack { // EXPERIENCE
                            
                            Text(card.experience) // exp values.
                                .padding(.bottom, 10)
                            
                            Text("Experience")
                            Image(systemName: "person.3")
                            
                        }.font(.system(size: 14))
                    }
                    
                    
                    
                    
                    Spacer(minLength: 5)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            
                            .opacity(0.5)
                        
                        VStack { // LOCATION
                            
                            Text(String(card.location) + " km") // loc values.
                                .padding(.bottom, 10)
                            
                            Text("Location")
                            Image(systemName: "mappin.circle")
                            
                        }.font(.system(size: 14))
                    }
                    
                }
                .padding(.horizontal, 50)
                .padding(.vertical)
                
                // fill here for tabs
                // add if index blabla whatever lah
                // buat description etc
                
                detailedCustomTab(indexTab: $indexTab)
                    .padding(.bottom, 10)
                
                if indexTab == 0 { // DESCRIPTION.
                    
                    HStack {
                        Text("Overview")
                            .bold()
                            .font(.title2)
                            .padding(1)
                        Spacer()
                    }.padding(.horizontal, 25)
                    
                    Text(card.description)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 25)
                        .padding(.trailing, 20)
                    
                } else if indexTab == 1 { // REQUIREMENTS.
                   
                    VStack {
                        HStack {
                            Text("Skills")
                                .bold()
                                .font(.title2)
                                .padding(1)
                            Spacer()
                        }.padding(.horizontal, 25)
                        
                        HStack {
                            Text(card.skills)
                            Spacer()
                        }.padding(.horizontal, 25)
                        
                        HStack {
                            Text("Experience Level")
                                .bold()
                                .font(.title2)
                                .padding(1)
                            Spacer()
                        }.padding(.horizontal, 25)
                        
                        
                        HStack {
                            Text(card.expLevel)
                            Spacer()
                        }.padding(.horizontal, 25)
                        
                        
                        HStack {
                            Text("Others")
                                .bold()
                                .font(.title2)
                                .padding(1)
                            Spacer()
                        }.padding(.horizontal, 25)
                        
                        HStack {
                            Text(card.others)
                            Spacer()
                        }.padding(.horizontal, 25)
                        
                
                        
                    }
                    
                    
                } else if indexTab == 2 { // PERSONALITY.
                    
                    // circleShape showing stats
                    
                    
                } // end of detailed buttons.
                
        }
    }
}
    
}
}

struct cardView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
        
    }
}
