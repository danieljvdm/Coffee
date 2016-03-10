//
//  ColorExtensions.swift
//  Coffee
//
//  Created by Daniel on 2/29/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation
import UIKit
import Hue

extension UIColor {
    static func coffeeBrown() -> UIColor {
        return self.hex("3B3A35")
    }
    
    static func coffeeCreme() -> UIColor {
        return self.hex("ECDFBD")
    }
    
    static func coffeeBlue() -> UIColor {
        return self.hex("31507f")
    }
    
    static func coffeeBlueNav() -> UIColor {
        return self.hex("20457C")
    }
    
    static func coffeeOrange() -> UIColor {
        return self.hex("FB6648")
    }
    
    static func coffeePurple() -> UIColor {
        return self.hex("5E3448")
    }
}