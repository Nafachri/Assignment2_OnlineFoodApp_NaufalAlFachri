//
//  AppDelegate.swift
//  OnlineFoodApp
//
//  Created by Naufal Al-Fachri on 08/07/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    let viewController = ViewController(nibName: "ViewController", bundle: nil)
    let navigationController = UINavigationController(rootViewController: viewController)

    
    window = .init(frame: UIScreen.main.bounds)
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
    
    if let storedTheme = UserDefaults.standard.string(forKey: "appTheme") {
        if storedTheme == "dark" {
            window?.overrideUserInterfaceStyle = .dark
        } else {
            window?.overrideUserInterfaceStyle = .light
        }
    } else {
        // Default to system appearance
        window?.overrideUserInterfaceStyle = .unspecified
    }
    
    return true
  }


}

