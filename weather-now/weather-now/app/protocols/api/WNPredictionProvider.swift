//
//  WNPredictionProvider.swift
//  weather-now
//
//  Created by Vitalii Kuznetsov on 22/08/2019.
//  Copyright © 2019 Vitalii Kuznetsov. All rights reserved.
//

import Foundation

typealias PredictionUpdateHandler = (success: (WNPrediction) -> Void, failure: (Error) -> Void)

protocol WNPredictionProvider {
    func requestWeatherPredictionForLocation(_ location: WNLocation, withHandler handler: PredictionUpdateHandler)
}
