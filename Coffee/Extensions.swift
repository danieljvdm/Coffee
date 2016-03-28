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

extension UIView {
    func findAllSubviews() -> [UIView] {
        let subviews = self.subviews
        if subviews.isEmpty { return [] }
        var views = subviews
        for view in subviews {
            views += view.findAllSubviews()
        }
        
        return views
    }
}

extension UILabel {
    
    func updateAttributedText(text: String) {
        guard let labelText = self.attributedText else {
            return
        }
        
        let existingAttributes = labelText.attributesAtIndex(0, effectiveRange: nil)
        self.attributedText = NSAttributedString(string: text, attributes: existingAttributes)
    }
    
    func addAttributes(attributes: [String: AnyObject]){
        guard let labelText = self.attributedText else {
            return
        }
        
        var existingAttributes = labelText.attributesAtIndex(0, effectiveRange: nil)
        existingAttributes.merge(attributes)
        self.attributedText = NSAttributedString(string: labelText.string, attributes: existingAttributes)
    }
}

extension Dictionary {
    mutating func merge<K, V>(dict: [K: V]){
        for (k, v) in dict {
            self.updateValue(v as! Value, forKey: k as! Key)
        }
    }
}