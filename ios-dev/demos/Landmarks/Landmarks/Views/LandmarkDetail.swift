//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Nathanael William on 27/03/21.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        ScrollView {
            //adding various views made.
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300, alignment: .center)
                .edgesIgnoringSafeArea(.top)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                        .font(.title)
                        .fontWeight(.medium)
                        .bold()
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    
                HStack {
                    Text(landmark.park)
                        
                    
                    Spacer()
                    
                    Text(landmark.state)
                        
                }//HStack
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 4.0)
                    
            
                
            }//VStack
            .padding()
            
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
    }
}
