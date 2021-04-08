//
//  companyCards.swift
//  duoProject
//
//  Created by Nathanael William on 07/04/21.
//

import Foundation
import SwiftUI

struct Card: Hashable, Codable, Identifiable {
    
    // put the names of the data here:
    
    // identifications.
    var id: Int
    var jobPosition: String
    var companyName: String
    var companyLocation: String
    var description: String
    
    // traits for selections.
    var salary: String
    var location: Double
    
    var isFavorite: Bool
    
    private var imageName: String
    var imageCompany: Image {
        Image(imageName)
    }
    
    
    // card positions for interaction.
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0
    
    
    static var data: [Card] { [
    
        Card(id: 0,
             jobPosition: "Software Developer",
             companyName: "Google Inc.",
             companyLocation: "Amsterdam, Netherlands",
             description: "",
             salary: "$3000/mo",
             location: 1.5,
             isFavorite: false,
             
             imageName: ""),
        
        Card(id: 1,
             jobPosition: "UX Designer",
             companyName: "Apple",
             companyLocation: "Brussels, Belgium",
             description: "",
             salary: "$2000/mo",
             location: 45.2,
             isFavorite: false,
             
             imageName: "")
    
    ]}
    
}
