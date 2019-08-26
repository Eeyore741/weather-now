//
//  WNAppDelegate.swift
//  weather-now
//
//  Created by Vitalii Kuznetsov on 22/08/2019.
//  Copyright © 2019 Vitalii Kuznetsov. All rights reserved.
//

/**
 `WNAppDelegate` is the main entrance point for the app conforming UIApplicationDelegate protocol
 */

import UIKit

@UIApplicationMain
class WNAppDelegate: UIResponder{

    var window: UIWindow? = {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = UIColor.black
        return window
    }()
}

extension WNAppDelegate: UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let model = WNPredictionModel(locationProvider: HardwareLocationService(), predictionProvider: DarkSkyPredictionService(url: "https://api.darksky.net", token: "2bb07c3bece89caf533ac9a5d23d8417"))
        let viewController = WNViewController(model)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
}

