    //
//  Shop.swift
//  Coffee
//
//  Created by Daniel on 2/26/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation
import CloudKit
import UIKit
import RxSwift
    
typealias Coordinates = (lat: Double, lon: Double)
    
class Shop {
    
    var realmShop: RealmShop
    
    var name: String {
        return realmShop.name
    }
    
    var city: City?
    
    var image: String? {
        return realmShop.image?.filePath
    }
    
    var address: String? {
        return realmShop.address
    }
    
    var neighborhood: String? {
        return realmShop.neighborhood
    }
    
    var coordinates: Coordinates? {
        guard let lat = realmShop.latitude.value, let lon = realmShop.longitude.value else { return nil }
        return Coordinates(lat: lat, lon: lon)
    }
    
    var bio: String? {
        return realmShop.bio
    }
    
    init(_ realmShop: RealmShop) {
        self.realmShop = realmShop
    }
}
