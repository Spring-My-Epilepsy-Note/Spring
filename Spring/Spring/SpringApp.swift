//
//  SpringApp.swift
//  Spring
//
//  Created by Hyesung Jeon on 2023/05/03.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}

@main
struct SpringApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var userViewModel: UserViewModel = UserViewModel()


  var body: some Scene {
    WindowGroup {
      NavigationView {
        LoginView()
              .onAppear {
          GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
          }
      }    .onOpenURL { url in
          GIDSignIn.sharedInstance.handle(url)
      }.environmentObject(userViewModel)
      }
    }
  }
}

