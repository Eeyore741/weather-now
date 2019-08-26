//
//  WNViewController.swift
//  weather-now
//
//  Created by Vitalii Kuznetsov on 22/08/2019.
//  Copyright © 2019 Vitalii Kuznetsov. All rights reserved.
//

/**
 `WNViewController` logicless view controller (View) with model class (WNPredictionModel) required on init stage
 */

import Foundation
import UIKit.UIViewController

class WNViewController: UIViewController {
    
    //MARK: - Class variables
    private class var genericTitleLabel: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }
    private class var genericValueLabel: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }
    private class var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "H:mm:ss\nyyyy/MM/dd"
        return dateFormatter
    }
    
    //MARK: - Instance UI
    private lazy var timezoneValue: UILabel = {
        return WNViewController.genericValueLabel
    }()
    private lazy var coordinatesValue: UILabel = {
        return WNViewController.genericValueLabel
    }()
    private lazy var temperatureValue: UILabel = {
        return WNViewController.genericValueLabel
    }()
    private lazy var timeValue: UILabel = {
        return WNViewController.genericValueLabel
    }()
    
    private let predictionModel: WNPredictionModel
    
    @available(*, unavailable, message: "Utilize designated initializer")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    required init(_ predictionModel: WNPredictionModel) {
        self.predictionModel = predictionModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        predictionModel.getWeatherPredictionWithHandler((onPredictionUpdateSuccess, onPredictionUpdateFailure))
    }
    
    private func setupUI(){
        view.backgroundColor = .white
//        view.translatesAutoresizingMaskIntoConstraints = false
        let timezoneLabel = WNViewController.genericTitleLabel
        timezoneLabel.text = "Timezone"
        view.addSubview(timezoneLabel)
        timezoneLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100.0).isActive = true
        timezoneLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        view.addSubview(timezoneValue)
        timezoneValue.topAnchor.constraint(equalTo: timezoneLabel.bottomAnchor, constant: 6.0).isActive = true
        timezoneValue.centerXAnchor.constraint(equalTo: timezoneLabel.centerXAnchor, constant: 0).isActive = true
        
        let coordinatesLabel = WNViewController.genericTitleLabel
        coordinatesLabel.text = "Coordinates"
        view.addSubview(coordinatesLabel)
        coordinatesLabel.topAnchor.constraint(equalTo: timezoneValue.bottomAnchor, constant: 24.0).isActive = true
        coordinatesLabel.centerXAnchor.constraint(equalTo: timezoneValue.centerXAnchor, constant: 0).isActive = true
        view.addSubview(coordinatesValue)
        coordinatesValue.topAnchor.constraint(equalTo: coordinatesLabel.bottomAnchor, constant: 6.0).isActive = true
        coordinatesValue.centerXAnchor.constraint(equalTo: coordinatesLabel.centerXAnchor, constant: 0).isActive = true
        
        let temperatureLabel = WNViewController.genericTitleLabel
        temperatureLabel.text = "Temperature"
        view.addSubview(temperatureLabel)
        temperatureLabel.topAnchor.constraint(equalTo: coordinatesValue.bottomAnchor, constant: 24.0).isActive = true
        temperatureLabel.centerXAnchor.constraint(equalTo: coordinatesValue.centerXAnchor, constant: 0).isActive = true
        view.addSubview(temperatureValue)
        temperatureValue.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 6.0).isActive = true
        temperatureValue.centerXAnchor.constraint(equalTo: temperatureLabel.centerXAnchor, constant: 0).isActive = true
        
        let timeLabel = WNViewController.genericTitleLabel
        timeLabel.text = "Time"
        view.addSubview(timeLabel)
        timeLabel.topAnchor.constraint(equalTo: temperatureValue.bottomAnchor, constant: 24.0).isActive = true
        timeLabel.centerXAnchor.constraint(equalTo: temperatureValue.centerXAnchor, constant: 0).isActive = true
        view.addSubview(timeValue)
        timeValue.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 6.0).isActive = true
        timeValue.centerXAnchor.constraint(equalTo: timeLabel.centerXAnchor, constant: 0).isActive = true
    }
    
    private func displayPrediction(_ prediction: WNPrediction){
        self.timezoneValue.text = prediction.timezone
        self.coordinatesValue.text = "Latitude: \(prediction.latitude)\nLongitude: \(prediction.longitude)"
        self.temperatureValue.text = "\(prediction.temperature)\u{00B0}"
        self.timeValue.text = WNViewController.dateFormatter.string(from: prediction.date)
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    //MARK: Model event actions
    func onPredictionUpdateSuccess(_ prediction: WNPrediction){
        DispatchQueue.main.async {
            defer {
                self.view.wnvl_unlock()
            }
            self.displayPrediction(prediction)
        }
    }
    
    func onPredictionUpdateFailure(_ error: Error){
        DispatchQueue.main.async {
            defer {
                self.view.wnvl_lockWithMessage(error.localizedDescription)
            }
            if
                (error as NSError).code == NSURLErrorNotConnectedToInternet {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3){
                    self.predictionModel.getWeatherPredictionWithHandler((self.onPredictionUpdateSuccess, self.onPredictionUpdateFailure))
                }
            }
        }
    }
}

//conformance to protocol extension
extension UIView: WNVisuallyLockable {}
