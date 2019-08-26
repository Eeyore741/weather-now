//
//  WNVisuallyLockable.swift
//  weather-now
//
//  Created by Vitalii Kuznetsov on 22/08/2019.
//  Copyright © 2019 Vitalii Kuznetsov. All rights reserved.
//

/**
 `WNVisuallyLockable` is the protocol with UIView extension providing simple realisation of view locking with message display
 */

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
        self.unlock()
        self.lockWithMessage(message)
    }
    
    func wnvl_unlock(){
        self.unlock()
    }
    
    private func lockWithMessage(_ message: String){
        self.subviews.forEach {
            $0.isUserInteractionEnabled = false
            $0.alpha = 0.1;
        }
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.center = self.convert(self.center, from: indicator)
        indicator.tag = self.functionTag
        self.addSubview(indicator)
        indicator.startAnimating()
        let messageLabel = UILabel(frame: self.bounds)
        messageLabel.textColor = .darkText
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.text = message
        messageLabel.center = self.convert(self.center, from: messageLabel).applying(CGAffineTransform(translationX: 0, y: indicator.frame.height * 2.5))
        messageLabel.tag = self.functionTag
        self.addSubview(messageLabel)
    }
    
    private func unlock(){
        self.subviews.forEach {
            $0.isUserInteractionEnabled = true
            $0.alpha = 1.0;
            if $0.tag == self.functionTag { $0.removeFromSuperview() }
        }
    }
}
