//
//  DarkSkyPrediction.swift
//  weather-now
//
//  Created by Vitalii Kuznetsov on 22/08/2019.
//  Copyright © 2019 Vitalii Kuznetsov. All rights reserved.
//

import Foundation

struct DarkSkyPrediction {
    
    let latitude: Double
    let longitude: Double
    let timezone: String
    let currently: DarkSkyWeather
}

extension DarkSkyPrediction: Codable { }
