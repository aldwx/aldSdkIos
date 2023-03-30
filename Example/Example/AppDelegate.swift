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
        AldAnalytics.initSDK(withAppKey: "fb51d47caf5d513e17142a60a7031a09",
                             debug:false,
                             launchOptions: launchOptions)
        AldAnalytics.trackAppInstall()
//        //自定义事件
//        AldAnalytics.trackEvent("Name", properties: ["name": "刘", "age": 18])
//        //预定义事件
        AldAnalytics.trackPredefined("AldCollect", properties: ["ald_content_id": "首页1-1","ald_content_name":"首页title"])
      
//        AldAnalytics.dloadChannel("app store")
        
        AldAnalytics.setLoginId("18518572418")

        
//        AldAnalytics.trackPredefined("AldTesta", properties: [
//           // 内容 ID
//            "ald_scan_corea": "qqq",
//            //位置序号
//            "ald_scan_resulta": "aaa",
//            "ald_scan_typea": "zzz"
//        ])
        
        

//        //自定义事件
//        AldAnalytics.trackEvent("sage", properties: ["sage1": "111", "sage2": "222"])
    
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

