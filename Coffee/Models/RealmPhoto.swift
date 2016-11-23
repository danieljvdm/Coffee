//
//  RealmPhoto.swift
//  Coffee
//
//  Created by Daniel van der Merwe on 11/23/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation
import RealmSwift

class RealmPhoto: Object {
    dynamic var id = ""
    dynamic var title = ""
    dynamic var filePath = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
