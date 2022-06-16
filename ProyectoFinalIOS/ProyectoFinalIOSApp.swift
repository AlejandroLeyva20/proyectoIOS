//
//  ProyectoFinalIOSApp.swift
//  ProyectoFinalIOS
//
//  Created by user222325 on 6/15/22.
//

import SwiftUI
import Firebase


class AppDelegate: NSObject, UIApplicationDelegate {


  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
                   [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct ProyectoFinalIOSApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    
    @StateObject var doctorViewModel = DoctorViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(authenticationViewModel: authenticationViewModel, doctorViewModel: doctorViewModel)
            /*
            if authenticationViewModel.user != nil{
                ContentView(authenticationViewModel: authenticationViewModel, doctorViewModel: doctorViewModel)
            }
            else {
                LoginView(authenticationViewModel: authenticationViewModel)
            }*/
            
        }
    }
}
