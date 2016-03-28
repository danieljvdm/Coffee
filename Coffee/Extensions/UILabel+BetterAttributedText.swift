//
//  UILabel+BetterAttributedText.swift
//  Coffee
//
//  Created by Daniel on 3/28/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation
import UIKit

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