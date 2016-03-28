//
//  LocationService.swift
//  Coffee
//
//  Created by Daniel on 3/10/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation
import CoreLocation
import RxSwift
import RxCocoa

class LocationService: NSObject {
    static let sharedInstance = LocationService()
    let locationManager = CLLocationManager()
    var authorized = CLLocationManager.authorizationStatus()
    var locations: Observable<CLLocation>?
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.delegate = self
        
        if authorized == .AuthorizedWhenInUse || authorized == .AuthorizedAlways {
            locationManager.startUpdatingLocation()
        } else {
            locationManager.requestAlwaysAuthorization()
        }
        
        locations = locationManager.rx_didUpdateLocations
            .map{return $0.last!}
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        authorized = status
    }
    
//    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let lastLoc = locations.last {
//            lastKnownLoc = lastLoc
//        }
//    }
}