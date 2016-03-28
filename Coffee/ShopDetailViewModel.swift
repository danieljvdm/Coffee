//
//  ShopDetailViewModel.swift
//  Coffee
//
//  Created by Daniel on 3/28/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation
import MapKit

class ShopDetailViewModel {
    let kRegionRadius: Double = 300
    private let shop: Shop
    let name: String
    let address: String
    let description: String
    let image: UIImage
    
    
    init(shop: Shop){
        self.shop = shop
        self.name = shop.name
        self.address = shop.address
        self.description = shop.description
        self.image = shop.image
    }
    
    func getMapMarker() -> MKPointAnnotation {
        let point = MKPointAnnotation()
        point.coordinate = shop.location.coordinate
        point.title = shop.name
        point.subtitle = shop.address
        return point 
    }
    
    func getMapRegion() -> MKCoordinateRegion {
        return MKCoordinateRegionMakeWithDistance(shop.location.coordinate,
                                                                  kRegionRadius * 2.0, kRegionRadius * 2.0)
    }
    
    func openMapsApp() {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://maps.apple.com/?ll=\(shop.location.coordinate.latitude),\(shop.location.coordinate.longitude)")!)
    }
    
    
}