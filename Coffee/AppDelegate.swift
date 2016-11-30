//
//  AppDelegate.swift
//  Coffee
//
//  Created by Daniel on 2/26/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        configure()
        
        // instatiate to get CLLocationManager going
        let _ = LocationService.sharedInstance
        
        let navCtrl = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navCtrl
        window?.makeKeyAndVisible()
        coordinator = AppCoordinator(root: navCtrl, api: APIService())
        coordinator?.start()
        return true
    }
    
    func configure() {
        UIApplication.shared.statusBarStyle = .lightContent
        UINavigationBar.appearance().titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "ProximaNova-Bold", size: 18.0)!,
            NSForegroundColorAttributeName: UIColor.white
        ]
        
        UINavigationBar.appearance().backgroundColor = UIColor.coffeeBlue()
        UINavigationBar.appearance().tintColor = UIColor.white

    }
}

