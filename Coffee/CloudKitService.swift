//
//  NetworkService.swift
//  Coffee
//
//  Created by Daniel on 3/3/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation
import CloudKit
import RxSwift
import RxCocoa

class CloudKitService {
    static let container = CKContainer.defaultContainer()
    static let publicData = container.publicCloudDatabase
    
    static func getShops(completion: (result: [Shop]) -> Void) {
        var shops = [Shop]()
        let query = CKQuery(recordType: "Shop", predicate: NSPredicate(value: true))
        publicData.performQuery(query, inZoneWithID: nil) { results, error in
            if let results = results {
                for shop in results {
                    shops.append(Shop(record: shop))
                }
                print(LocationService.sharedInstance.lastKnownLoc)
                completion(result: shops)
            }
        }
    }
    
//    static func getAllShops() -> Observable<Shop> {
//        let query = CKQuery(recordType: "Shop", predicate: NSPredicate(value: true))
//        publicData.performQuery(query, inZoneWithID: nil) { results, error in
//            
//        }
//    }
    
    static func getNearestShops(location: CLLocation = CLLocation(latitude: 40.7459766, longitude: -74.00466310000002), completion: (result: [Shop]) -> Void){
        var shops = [Shop]()
        let predicate = NSPredicate(format: "distanceToLocation:fromLocation:(Location, %@) < 40000000", location)
        let query = CKQuery(recordType: "Shop", predicate: predicate)
        publicData.performQuery(query, inZoneWithID: nil) { results, error in
            if let results = results {
                for shop in results {
                    shops.append(Shop(record: shop))
                }
                completion(result: shops)
            }
        }
    }

}