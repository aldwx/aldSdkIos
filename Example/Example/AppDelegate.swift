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
        AldAnalytics.initSDK(withAppKey: "9d27d269c09183b8fb192442b9e9b2a8",
                             debug:false,
                             launchOptions: launchOptions)
        AldAnalytics.trackAppInstall()
//        //自定义事件
//        AldAnalytics.trackEvent("Name", properties: ["name": "刘", "age": 18])
//        //预定义事件
//        AldAnalytics.trackPredefined("Ald_Name", properties: ["ald_cc": "cc"])
      
        AldAnalytics.dloadChannel("模拟器");
        AldAnalytics.trackPredefined("AldTestb", properties: [
           // 内容 ID
            "ald_scan_coreb": "1001",
            //位置序号
            "ald_scan_resultb": "12342",
            "ald_scan_typb": "123"
        ])
        
        
//
//        //自定义事件
//        AldAnalytics.trackEvent("wxandiosandandriod", properties: ["pro01_wxiosandriod": "11", "pro02_wxiosandriod": "22"])
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

