//
//  HardwareLocationService+WNLocationProvider.swift
//  weather-now
//
//  Created by Vitalii Kuznetsov on 24/08/2019.
//  Copyright © 2019 Vitalii Kuznetsov. All rights reserved.
//

/**
 File provides domain specific HardwareLocationService type conformance to app specific WNLocationProvider protocol
 */

import Foundation
import CoreLocation

extension HardwareLocationService: WNLocationProvider{
    
    func startLocationUpdateWithHandler(_ handler: LocationUpdateHandler) {
        locationUpdateHandler = handler
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            coreLocationManager.requestWhenInUseAuthorization();
        case .denied, .restricted:
            locationUpdateHandler?.failure(HardwareLocationService.Status.unavailable)
        default:
            guard
                CLLocationManager.authorizationStatus() == .authorizedWhenInUse
                else{
                    return handler.failure(HardwareLocationService.Status.unavailable)
            }
            coreLocationManager.requestLocation()
            coreLocationManager.startMonitoringSignificantLocationChanges()
        }
    }
    
    func stopLocationUpdate() {
        coreLocationManager.stopMonitoringSignificantLocationChanges()
    }
}
