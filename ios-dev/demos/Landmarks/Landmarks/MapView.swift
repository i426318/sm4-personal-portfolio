//
//  MapView.swift
//  Landmarks
//
//  Created by Nathanael William on 27/03/21.
//


// "When you import SwiftUI and certain other frameworks in the same file, you gain access to SwiftUI-specific functionality provided by that framework." - Apple Developers.

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        
        //sets pinpoint location.
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        
        //sets span of location using delta.
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        
        //MapView -> takes binding to var region.
        Map(coordinateRegion: $region)
            
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
