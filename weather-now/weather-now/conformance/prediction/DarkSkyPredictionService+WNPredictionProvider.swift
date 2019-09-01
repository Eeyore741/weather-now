//
//  DarkSkyPredictionService+WNPredictionProvider.swift
//  weather-now
//
//  Created by Vitalii Kuznetsov on 24/08/2019.
//  Copyright © 2019 Vitalii Kuznetsov. All rights reserved.
//

/**
 File provides domain specific DarkSkyPredictionService type conformance to app specific WNPredictionProvider protocol
 */

import Foundation

extension DarkSkyPredictionService: WNPredictionProvider{
    
    private var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }
    
    func requestWeatherPredictionForLocation(_ location: WNLocation, withHandler handler: PredictionUpdateHandler) {
        self.requestPrediction(withLatitude: location.latitude,
                               longitude: location.longitude) {
                                data, response, error in
                                if
                                    let error = error{
                                    return handler.failure(error)
                                }
                                guard
                                    let data = data
                                    else { return handler.failure(DarkSkyPredictionService.Error.noData) }
                                do{
                                    let prediction = try self.decoder.decode(DarkSkyPrediction.self, from: data)
                                    handler.success(prediction)
                                }
                                catch{
                                    return handler.failure(error)
                                }
        }
    }
}
