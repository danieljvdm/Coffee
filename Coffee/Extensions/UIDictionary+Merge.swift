//
//  UIDictionary+Merge.swift
//  Coffee
//
//  Created by Daniel on 3/28/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation

extension Dictionary {
    mutating func merge<K, V>(_ dict: [K: V]){
        for (k, v) in dict {
            self.updateValue(v as! Value, forKey: k as! Key)
        }
    }
}
