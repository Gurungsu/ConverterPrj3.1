//
//  AppDelegate.swift
//  ConverterPrj3
//
//  Created by suman on 10/3/20.
//  Copyright © 2020 jumper. All rights reserved.
//
import UIKit

let BACKGROUND_COLOR = UIColor.init(red:0.13, green: 0.65, blue:0.42, alpha: 0.9)


let FOREGROUND_COLOR = UIColor.init(red: 0.937, green: 0.820, blue: 0.576, alpha: 1.0)


let TRANSPARENT_COLOR = UIColor.init(red:10, green: 21, blue:21, alpha: 0.5)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let navAppearance = UINavigationBar.appearance()
        navAppearance.barTintColor = BACKGROUND_COLOR
        navAppearance.tintColor = FOREGROUND_COLOR
        navAppearance.isTranslucent = false
        navAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}




