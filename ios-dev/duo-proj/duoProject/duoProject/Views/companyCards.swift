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
    var experience: String
    
    var skills: String
    var expLevel: String
    var others: String
    
    var isFavorite: Bool
    
    var imageName: String
    var imageCompany: Image {
        Image(imageName)
    }
    
    
    // card positions for interaction.
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0
    
    
    static var data: [Card] { [
    
        Card(id: 1,
             jobPosition: "Software Developer",
             companyName: "Google Inc.",
             companyLocation: "Amsterdam, Netherlands",
             description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
             salary: "$3000/mo",
             location: 1.5,
             experience: "Fresh-graduate",
             
             skills:"C#, Java, C++, .NET",
             
             expLevel: "Mid level (2-3 yrs)",
             
             others: "Python is a plus :)",
             
             isFavorite: false,
             
             imageName: ""),
        
        Card(id: 2,
             jobPosition: "UX Designer",
             companyName: "Apple",
             companyLocation: "Brussels, Belgium",
             description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
             salary: "$2000/mo",
             location: 45.2,
             experience: "Senior",
             
             skills:"Figma, XD, Axure",
             
             expLevel: "Mid level (2-3 yrs)",
             
             others: "Photoshop and Illustrator for side-design shenanigans :)",
             
             isFavorite: false,
             
             imageName: "")
    
    ]}
    
}
