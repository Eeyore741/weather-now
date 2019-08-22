//
//  WNLocationProvider.swift
//  weather-now
//
//  Created by Vitalii Kuznetsov on 22/08/2019.
//  Copyright © 2019 Vitalii Kuznetsov. All rights reserved.
//

import Foundation

typealias Location = (latitude: Double, longitude: Double)
typealias LocationUpdateHandler = (success: (Location)->Void, failure: (Error)->Void)

protocol WNLocationProvider {
    func startLocationUpdateWithHandler(_ handler: LocationUpdateHandler)
    func stopLocationUpdate()
}
