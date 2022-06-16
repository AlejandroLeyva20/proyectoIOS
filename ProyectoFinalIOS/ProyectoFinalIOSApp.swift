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
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
            /*if authenticationViewModel.user != nil{
                ContentView(authenticationViewModel: AuthenticationViewModel())
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            else {
                LoginView(authenticationViewModel: authenticationViewModel)
            }*/
            
        }
    }
}
