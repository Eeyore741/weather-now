//
//  DarkSkyPredictionService.swift
//  weather-now
//
//  Created by Vitalii Kuznetsov on 24/08/2019.
//  Copyright © 2019 Vitalii Kuznetsov. All rights reserved.
//

import Foundation

typealias ResponseHandler = (Data?, URLResponse?, Error?) -> Void

class DarkSkyPredictionService{
    
    private let token: String
    private let baseUrl: String
    private let urlSession = URLSession.shared
    private let function = "forecast"
    
    required init(url: String, token: String) {
        self.baseUrl = url
        self.token = token
    }
    
    private func predictionRequestUrlWithLatitude(_ latitude: Double, andLongitude longitude: Double) -> URL?{
        guard
            var components = URLComponents(string: baseUrl)
            else { return nil }
        components.path = "/\(function)/\(token)/\(latitude),\(longitude)"
        return components.url
    }
    
    func requestPrediction(withLatitude latitude: Double, longitude: Double, andCompletionHandler handler: @escaping ResponseHandler){
        guard
            let url = predictionRequestUrlWithLatitude(latitude, andLongitude: longitude)
            else { return }
        let task = urlSession.dataTask(with: url, completionHandler: handler)
        task.resume()
    }
}
