//
//  MapKit+Extensions.swift
//  Coffee
//
//  Created by Daniel van der Merwe on 11/23/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation
import MapKit
import RxSwift

func MKCoordinateRegion(coordinates: (lat: Double, lon: Double), radius: Double = 2000000.0) -> MKCoordinateRegion {
    return MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D(latitude: coordinates.lat, longitude: coordinates.lon), radius, radius)
}

extension CLLocation {
    convenience init(coordinates: (lat: Double, lon: Double)) {
        self.init(latitude: coordinates.lat, longitude: coordinates.lon)
    }
    
    func region(with radius: Double) -> MKCoordinateRegion {
        return MKCoordinateRegionMakeWithDistance(self.coordinate, radius, radius)
    }
}

extension CLLocationCoordinate2D: Equatable { }

public func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
    return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
}

extension ObservableType where E == CLLocation {
    func distinctUntilChangeGreaterThan(meters: CLLocationDistance) -> Observable<CLLocation> {
        return self.scan(CLLocation(), accumulator: { lastLocation, location in
            if lastLocation.distance(from: location) > meters {
                return location
            } else {
                return lastLocation
            }
        }).distinctUntilChanged { lhs, rhs in
            return lhs.coordinate == rhs.coordinate
        }
    }
}
