//
//  String+URL.swift
//  Coffee
//
//  Created by Daniel van der Merwe on 11/23/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation

extension String {
    func toUrl() -> URL? {
        return URL(string: self)
    }
}
