//
//  ButtonExtension.swift
//  CodingChallenge
//
//  Created by Steven Harvath on 8/6/16.
//  Copyright © 2016 Steven Harvath. All rights reserved.
//

import Foundation
import UIKit
import UIColor_Hex_Swift

extension UIButton {
    
    public func layerGradient(hex1: String, hex2: String) {
        let layer: CAGradientLayer = CAGradientLayer()
        layer.frame.size = self.frame.size
        layer.frame.origin = CGPointMake(0.0,0.0)
        
        let topColor = UIColor(rgba: hex1).CGColor
        let bottomColor = UIColor(rgba: hex2).CGColor
        
        layer.colors = [topColor, bottomColor]
        self.layer.insertSublayer(layer, atIndex: 0)
    }
    
}
