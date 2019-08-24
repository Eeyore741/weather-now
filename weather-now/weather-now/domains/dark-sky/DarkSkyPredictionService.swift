//
//  DarkSkyPredictionService.swift
//  weather-now
//
//  Created by Vitalii Kuznetsov on 24/08/2019.
//  Copyright © 2019 Vitalii Kuznetsov. All rights reserved.
//

import Foundation

//https://api.darksky.net/forecast/2bb07c3bece89caf533ac9a5d23d8417/59.337239,18.062381

class DarkSkyPredictionService{
    
    private let token: String
    private let baseUrl: String
    private let urlSession = URLSession.shared
    private let function = "forecast"
    
    required init(url: String, token: String) {
        self.baseUrl = url
        self.token = token
    }
    
    func predictionRequestUrlWithLatitude(_ latitude: Double, andLongitude longitude: Double) -> URL?{
        guard
            var components = URLComponents(string: baseUrl)
            else { return nil }
        components.path = "/\(function)/\(token)/\(latitude),\(longitude)"
        return components.url
    }
}
