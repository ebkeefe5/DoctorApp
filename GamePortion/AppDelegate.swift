//
//  AppDelegate.swift
//  GamePortion
//
//  Created by Eric Keefe on 10/19/18.
//  Copyright © 2018 Eric Keefe. All rights reserved.
//

import UIKit
import AVKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Override point for customization after application launch.
        // Sets background to a blank/empty image
        // Override point for customization after application launch.
        // Sets background to a blank/empty image
        /*UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        // Sets shadow (line below the bar) to a blank image
        UINavigationBar.appearance().shadowImage = UIImage()
        // Sets the translucent background color
        UINavigationBar.appearance().backgroundColor = .clear
        
        // Set translucent. (Default value is already true, so this can be removed if desired.)
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.1)
        // Set translucent. (Default value is already true, so this can be removed if desired.)
        //UINavigationBar.appearance().isTranslucent = true
        
        */
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
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback);
        }catch{
            print("AVAudioSession CategoryPlayBack didn't work");
        }
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

