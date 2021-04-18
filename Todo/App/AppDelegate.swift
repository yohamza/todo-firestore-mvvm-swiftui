//
//  AppDelegate.swift
//  Todo
//
//  Created by Ameer Hamza on 17/04/2021.
//

import UIKit
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        Auth.auth().signInAnonymously()
        return true
    }
}
