//
//  WNLocation.swift
//  weather-now
//
//  Created by Vitalii Kuznetsov on 22/08/2019.
//  Copyright © 2019 Vitalii Kuznetsov. All rights reserved.
//

/**
 `WNLocation` protocol is the app specific interface representing location
 */

import Foundation

protocol WNLocation {
    var latitude: Double { get }
    var longitude: Double { get }
}
