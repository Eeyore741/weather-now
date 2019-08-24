//
//  DarkSkyPredictionService+WNPredictionProvider.swift
//  weather-now
//
//  Created by Vitalii Kuznetsov on 24/08/2019.
//  Copyright © 2019 Vitalii Kuznetsov. All rights reserved.
//

import Foundation

extension DarkSkyPredictionService: WNPredictionProvider{
    
    func requestWeatherPredictionForLocation(_ location: WNLocation, withHandler handler: PredictionUpdateHandler) {
        guard
            let url = predictionRequestUrlWithLatitude(location.latitude, andLongitude: location.longitude)
            else { fatalError("no request") }
        let task = self.urlSession.dataTask(with: url) {
            (data, response, error) in
        }
        task.resume()
    }
}
