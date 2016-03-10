//
//  LocationService.swift
//  Coffee
//
//  Created by Daniel on 3/10/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation
import CoreLocation

class LocationService: NSObject {
    static let sharedInstance = LocationService()
    let locationManager = CLLocationManager()
    var authorized = CLLocationManager.authorizationStatus()
    var lastKnownLoc: CLLocation?
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.delegate = self

        if authorized == .AuthorizedWhenInUse || authorized == .AuthorizedAlways {
            locationManager.startUpdatingLocation()
        } else {
            locationManager.requestAlwaysAuthorization()
        }
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        authorized = status
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLoc = locations.last {
            lastKnownLoc = lastLoc
            print(lastKnownLoc)
        }
    }
}