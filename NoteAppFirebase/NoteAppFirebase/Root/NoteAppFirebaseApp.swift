//
//  NoteAppFirebaseApp.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import FirebaseCore
import SwiftUI

@main
struct NoteAppFirebaseApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
    {
        FirebaseApp.configure()

        return true
    }
}
