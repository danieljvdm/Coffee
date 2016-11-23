//
//  MapKit+Extensions.swift
//  Coffee
//
//  Created by Daniel van der Merwe on 11/23/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation
import MapKit

func MKCoordinateRegion(coordinates: (lat: Double, lon: Double), radius: Double = 2000000.0) -> MKCoordinateRegion {
    return MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D(latitude: coordinates.lat, longitude: coordinates.lon), radius, radius)
}

extension CLLocation {
    convenience init(coordinates: (lat: Double, lon: Double)) {
        self.init(latitude: coordinates.lat, longitude: coordinates.lon)
    }
}
