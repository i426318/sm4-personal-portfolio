//
//  cardView.swift
//  duoProject
//
//  Created by Nathanael William on 07/04/21.
//

import SwiftUI

struct cardView: View {
    var body: some View {
        
        let txtSubColor = Color.init(red: 135/255, green: 135/255, blue: 135/255)
        let bgColor = Color.init(red: 255/255, green: 255/255, blue: 250/255)
        
        
            ZStack {
                
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                  .foregroundColor(bgColor)
                  .padding()
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                VStack {
                    Image(systemName: "clear") // image of company.
                        .foregroundColor(.blue)
                        .font(.system(size: 100))
                    
                    Text("Software Developer") // job title.
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    
                        Text("Google, Inc.") // companyName.
                            .padding(.top, 1)
                            .font(.system(size: 20))
                        
                        Text("Amsterdam, Netherlands") // location.
                    
                    .font(.subheadline)
                    .foregroundColor(txtSubColor)
                    .padding(.horizontal, 25)
                   
                    
                    Divider()
                    
                    Text("Compatibility")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .padding(.bottom, 10)
                        .padding(.top, 10)
                    
                    
                    HStack {
                        VStack { // SALARY
                            Text("$5000/mo") // salary values.
                                .padding(.bottom, 10)
                            
                            Text("Salary")
                                
                            
                            Image(systemName: "dollarsign.circle")
                            
                        }.font(.system(size: 14))
                        
                        Spacer(minLength: 5)
                       
                        VStack { // EXPERIENCE
                            
                            Text("Fresh-graduate") // exp values.
                                .padding(.bottom, 10)
                            
                            Text("Experience")
                            Image(systemName: "person.3")
                            
                        }.font(.system(size: 14))
                        
                        
                        Spacer(minLength: 5)
                        
                        VStack { // LOCATION
                            
                            Text("1,5km") // loc values.
                                .padding(.bottom, 10)
                            
                            Text("Location")
                            Image(systemName: "mappin.circle")
                            
                        }.font(.system(size: 14))
                        
                        
                        
                    }
                    .padding(.horizontal, 50)
                    .padding(.vertical)
                }
                
                
            }
        
        
    }
}


struct cardView_Previews: PreviewProvider {
    static var previews: some View {
        cardView()
    }
}
