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
        guard
            let weatherApiUrl = Bundle.main.object(forInfoDictionaryKey: "DARK_SKY_BASE_URL") as? String
            else{ fatalError("Darks Sky api url required") }
        guard
            let weatherApiToken = Bundle.main.object(forInfoDictionaryKey: "DARK_SKY_API_TOKEN") as? String
            else{ fatalError("Darks Sky api token required") }
        let predictionService = DarkSkyPredictionService(url: "https://\(weatherApiUrl)",
                                                          token: weatherApiToken)
        let locationService = HardwareLocationService()
        let model = WNPredictionModel(locationProvider: locationService,
                                      predictionProvider: predictionService)
        let viewController = WNViewController(model)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
}

