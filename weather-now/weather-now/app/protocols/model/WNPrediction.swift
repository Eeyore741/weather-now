//
//  WNPrediction.swift
//  weather-now
//
//  Created by Vitalii Kuznetsov on 24/08/2019.
//  Copyright © 2019 Vitalii Kuznetsov. All rights reserved.
//

import Foundation

protocol WNPrediction {
    var latitude: Double { get }
    var longitude: Double { get }
    var timezone: String { get }
    var temperature: Double { get }
    var date: Date { get }
}
