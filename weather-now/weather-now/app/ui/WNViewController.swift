//
//  WNViewController.swift
//  weather-now
//
//  Created by Vitalii Kuznetsov on 22/08/2019.
//  Copyright © 2019 Vitalii Kuznetsov. All rights reserved.
//

import Foundation
import UIKit.UIViewController

class WNViewController: UIViewController {
    
    private weak var textView: UITextView?
    private let predictionModel: WNPredictionModel
    
    @available(*, unavailable, message: "Utilize designated initializer")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    required init(_ predictionModel: WNPredictionModel) {
        self.predictionModel = predictionModel
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        let textView = UITextView(frame: UIScreen.main.bounds)
        self.view.addSubview(textView)
        self.textView = textView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        predictionModel.getWeatherPredictionWithHandler((onPredictionUpdateSuccess, onPredictionUpdateFailure))
    }
    
    //MARK: Model event actions
    func onPredictionUpdateSuccess(_ prediction: WNPrediction){
        defer {
            view.wnvl_unlock()
        }
        print("view got prediction \(prediction)")
//        textView?.text = #function + " \(textView?.text ?? "_")\n \(location.latitude) & \(location.longitude)"
    }
    
    func onPredictionUpdateFailure(_ error: Error){
        defer {
            view.wnvl_lockWithMessage(error.localizedDescription)
        }
        print("view got error \(error.localizedDescription)")
//        textView?.text = " \(textView?.text ?? "_")\n" + #function + error.localizedDescription
    }
}

extension UIView: WNVisuallyLockable{}
