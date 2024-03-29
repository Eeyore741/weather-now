//
//  DarkSkyWeather.swift
//  weather-now
//
//  Created by Vitalii Kuznetsov on 22/08/2019.
//  Copyright © 2019 Vitalii Kuznetsov. All rights reserved.
//

/**
 `DarkSkyWeather` represents weather from darksky.net domain
*/

import Foundation

struct DarkSkyWeather {
    
    let time: Date
    let temperature: Double
}

extension DarkSkyWeather: Codable { }
