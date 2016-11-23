//
//  RealmShop.swift
//  Coffee
//
//  Created by Daniel van der Merwe on 11/23/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation
import RealmSwift

class RealmShop: Object {
    dynamic var id = ""
    dynamic var name = ""
    dynamic var city: RealmCity?
    dynamic var image: RealmPhoto?
    dynamic var address: String?
    dynamic var neighborhood: String?
    let latitude = RealmOptional<Double>()
    let longitude = RealmOptional<Double>()
    dynamic var bio: String?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
