//
//  DarkSkyPrediction+WNPrediction.swift
//  weather-now
//
//  Created by Vitalii Kuznetsov on 25/08/2019.
//  Copyright © 2019 Vitalii Kuznetsov. All rights reserved.
//

import Foundation

extension DarkSkyPrediction: WNPrediction{
    
    var temperature: Double {
        return self.currently.temperature
    }
}
