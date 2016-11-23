//
//  RealmCity.swift
//  Coffee
//
//  Created by Daniel van der Merwe on 11/23/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation
import RealmSwift

class RealmCity: Object {
    dynamic var id = ""
    dynamic var name = ""

    override static func primaryKey() -> String? {
        return "id"
    }
}
