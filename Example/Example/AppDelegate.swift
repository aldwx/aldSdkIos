//
//  AppDelegate.swift
//  Example
//
//  Created by MC on 2022/10/12.
//

import UIKit
import AldAnalytics

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        AldAnalytics.initSDK(withAppKey: "bf9dbf67fc393e123492e38d7e83086c", launchOptions: launchOptions)
        AldAnalytics.trackAppInstall()
        AldAnalytics.trackEvent("Name", properties: ["name": "刘", "age": 18])
        AldAnalytics.trackPredefined("Ald_Name", properties: ["ald_cc": "cc"])
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

