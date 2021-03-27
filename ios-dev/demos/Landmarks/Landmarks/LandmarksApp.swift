//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Nathanael William on 27/03/21.
//

import SwiftUI

@main
struct LandmarksApp: App {
    
    /*
     "@StateObject attribute to initialize a model object
     for a given property only once during the life time of the app." - Apple Devs
     */
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
