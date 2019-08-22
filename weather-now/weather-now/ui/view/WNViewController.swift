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
    
    @available(*, unavailable, message: "Utilize designated initializer")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    required init(color: UIColor) {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = color
    }
}
