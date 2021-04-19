//
//  Landmark.swift
//  Landmarks
//
//  Created by Nathanael William on 27/03/21.
//


// "Define a Landmark structure with a few properties
// matching names of some of the keys in the landmarkData.json data file." - Apple Devs

import Foundation
import SwiftUI
import CoreLocation // "Core Location provides services that determine a device’s geographic location, altitude, and orientation, or its position relative to a nearby iBeacon device." - Apple.

struct Landmark: Hashable, Codable, Identifiable { //adding 'Codable' eases data load into the struct from the data file.
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
        enum Category: String, CaseIterable, Codable {
            case lakes = "Lakes"
            case rivers = "Rivers"
            case mountains = "Mountains"
        }
    
    /* add imageName property to:
     - read the name of the image from the data,
     - computed image prop -> loads the image from the asset.
    */
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
