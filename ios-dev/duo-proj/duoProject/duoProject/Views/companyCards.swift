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
}
