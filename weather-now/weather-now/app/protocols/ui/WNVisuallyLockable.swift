//
//  WNVisuallyLockable.swift
//  weather-now
//
//  Created by Vitalii Kuznetsov on 22/08/2019.
//  Copyright © 2019 Vitalii Kuznetsov. All rights reserved.
//

import Foundation
import UIKit.UIView

protocol WNVisuallyLockable {
    
    func wnvl_lockWithMessage(_ message: String)
    func wnvl_unlock()
}

extension WNVisuallyLockable where Self: UIView{
    
    private var functionTag: Int {
        return String(#function).hashValue
    }
    
    func wnvl_lockWithMessage(_ message: String){
        wnvl_unlock()
        subviews.forEach {
            $0.isUserInteractionEnabled = false
            $0.alpha = 0.1;
        }
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.center = convert(center, from: indicator)
        indicator.tag = functionTag
        addSubview(indicator)
        indicator.startAnimating()
        let messageLabel = UILabel(frame: self.bounds)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.textColor = .darkText
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.text = message
        messageLabel.center = convert(center, from: messageLabel).applying(CGAffineTransform(translationX: 0, y: indicator.frame.height * 2.5))
        messageLabel.tag = functionTag
        addSubview(messageLabel)
    }
    
    func wnvl_unlock(){
        subviews.forEach {
            $0.isUserInteractionEnabled = true
            $0.alpha = 1.0;
            if $0.tag == functionTag { $0.removeFromSuperview() }
        }
    }
}
