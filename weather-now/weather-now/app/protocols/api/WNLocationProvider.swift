//
//  WNLocationProvider.swift
//  weather-now
//
//  Created by Vitalii Kuznetsov on 22/08/2019.
//  Copyright © 2019 Vitalii Kuznetsov. All rights reserved.
//

/**
 `WNLocationProvider` is the app specific protocol providing location information
 */

import Foundation

typealias LocationUpdateHandler = (success: (WNLocation) -> Void, failure: (Error) -> Void)

protocol WNLocationProvider {
    func startLocationUpdateWithHandler(_ handler: LocationUpdateHandler)
    func stopLocationUpdate()
}
