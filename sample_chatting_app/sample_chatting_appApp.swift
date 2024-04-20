//
//  sample_chatting_appApp.swift
//  sample_chatting_app
//
//  Created by Ratnakar on 28/02/24.
//

import SwiftUI
import FirebaseCore

@main
struct sample_chatting_appApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            if AiChatUserDefaults.getUserUid() != "" {
                BottomTabBar()
            } else {
                LoginOrSignUpView()
            }
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
