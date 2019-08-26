//
//  WNPredictionModel.swift
//  weather-now
//
//  Created by Vitalii Kuznetsov on 24/08/2019.
//  Copyright © 2019 Vitalii Kuznetsov. All rights reserved.
//

/**
 `WNPredictionModel` is the application main model class.
 Model supported by additional WNLocation & WNPrediction protocols
 Data provided by two required types conforming WNLocationProvider & WNPredictionProvider protocols.
 */

import Foundation

class WNPredictionModel {
    
    private let locationProvider: WNLocationProvider
    private let predictionProvider: WNPredictionProvider
    private var predictionUpdateHandler: PredictionUpdateHandler?
    
    required init(locationProvider: WNLocationProvider, predictionProvider: WNPredictionProvider) {
        self.locationProvider = locationProvider
        self.predictionProvider = predictionProvider
    }
    
    func getWeatherPredictionWithHandler(_ handler: PredictionUpdateHandler){
        predictionUpdateHandler = handler
        locationProvider.startLocationUpdateWithHandler((onLocationUpdateSuccess, onLocationUpdateFailure))
    }
    
    //MARK: Location event actions
    func onLocationUpdateSuccess(_ location: WNLocation){
        if
            let predictionUpdateHandler = predictionUpdateHandler{
            predictionProvider.requestWeatherPredictionForLocation(location, withHandler: predictionUpdateHandler)
        }
    }
    
    func onLocationUpdateFailure(_ error: Error){
        predictionUpdateHandler?.failure(error)
    }
}
