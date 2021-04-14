//
//  FirebaseConnectionAppApp.swift
//  FirebaseConnectionApp
//
//  Created by Nathanael William on 12/04/21.
//

import SwiftUI
import Firebase

import UIKit

//setting up app delegate for firestore...
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Configure FirebaseApp
        FirebaseApp.configure()
        return true
    }
}

@main
struct FirebaseConnectionAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
