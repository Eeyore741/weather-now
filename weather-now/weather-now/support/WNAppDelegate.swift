//
//  WNAppDelegate.swift
//  weather-now
//
//  Created by Vitalii Kuznetsov on 22/08/2019.
//  Copyright © 2019 Vitalii Kuznetsov. All rights reserved.
//

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
        let viewController = WNViewController.init(color: UIColor.lightGray)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
}

