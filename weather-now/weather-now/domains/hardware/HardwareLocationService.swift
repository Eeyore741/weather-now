//
//  HardwareLocationService.swift
//  weather-now
//
//  Created by Vitalii Kuznetsov on 22/08/2019.
//  Copyright © 2019 Vitalii Kuznetsov. All rights reserved.
//

import Foundation
import CoreLocation

enum LocationAccessStatus: String{
    case unavailable = "Device location api is not available"
    case available = "Device location is available"
}

extension LocationAccessStatus: LocalizedError{
    
    var errorDescription: String?{
        return rawValue
    }
}

class HardwareLocationService: NSObject{
    
    let coreLocationManager: CLLocationManager
    var locationUpdateHandler: LocationUpdateHandler?
    
    override init() {
        coreLocationManager = CLLocationManager.init()
        coreLocationManager.activityType = .other
        coreLocationManager.pausesLocationUpdatesAutomatically = true
        coreLocationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        coreLocationManager.distanceFilter = 100
        super.init()
        coreLocationManager.delegate = self
    }
}

extension HardwareLocationService: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if
            let location = locations.last{
            locationUpdateHandler?.success(location.coordinate)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if
            let locationUpdateHandler = locationUpdateHandler{
            startLocationUpdateWithHandler(locationUpdateHandler)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationUpdateHandler?.failure(error)
    }
}
