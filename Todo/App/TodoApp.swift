//
//  TodoApp.swift
//  Todo
//
//  Created by Ameer Hamza on 06/04/2021.
//

import SwiftUI
import Firebase

@main
struct TodoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
    }
}
