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
    fileprivate let shop: Shop
    let name: String
    let address: String
    let bio: String
    var imageUrl: URL?
    
    
    init(shop: Shop){
        self.shop = shop
        self.name = shop.name
        self.address = shop.address ?? ""
        self.bio = shop.bio ?? ""
        if let imageString = shop.image {
            self.imageUrl = URL(string: imageString)
        }
    }
    
    func getMapMarker() -> MKPointAnnotation {
        let point = MKPointAnnotation()
        point.coordinate = CLLocationCoordinate2D(latitude: shop.coordinates!.lat, longitude: shop.coordinates!.lon)
        point.title = shop.name
        point.subtitle = shop.address
        return point 
    }
    
    func getMapRegion() -> MKCoordinateRegion {
        return MKCoordinateRegion(coordinates: self.shop.coordinates!, radius: kRegionRadius * 2.0)
    }
    
    func openMapsApp() {
        UIApplication.shared.openURL(URL(string: "http://maps.apple.com/?ll=\(shop.coordinates!.lat),\(shop.coordinates!.lon)")!)
    }    
}
