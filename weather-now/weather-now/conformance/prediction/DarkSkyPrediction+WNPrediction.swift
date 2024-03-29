//
//  DarkSkyPrediction+WNPrediction.swift
//  weather-now
//
//  Created by Vitalii Kuznetsov on 25/08/2019.
//  Copyright © 2019 Vitalii Kuznetsov. All rights reserved.
//

/**
 File provides domain specific DarkSkyPrediction type conformance to app specific WNPrediction protocol
 */

import Foundation

extension DarkSkyPrediction: WNPrediction{
    
    var temperature: Double {
        return self.currently.temperature
    }
    
    var date: Date {
        return self.currently.time
    }
}
