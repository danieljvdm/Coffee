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
    static let container = CKContainer.default()
    static let publicDB = container.publicCloudDatabase
    
    static func getShops(_ completion: @escaping (_ result: [Shop]) -> Void) {
        var shops = [Shop]()
        let query = CKQuery(recordType: "Shop", predicate: NSPredicate(value: true))
        publicDB.perform(query, inZoneWith: nil) { results, error in
            if let results = results {
                for shop in results {
                    shops.append(Shop(record: shop))
                }
                completion(shops)
            }
        }
    }
    
    static func getShops(_ city: City, summary: Bool = false) -> Observable<[Shop]> {
        return Observable.create { observer in
            var shops = [Shop]()
            let cityPredicate = NSPredicate(format: "City BEGINSWITH '\(city.name)'")
            let query = CKQuery(recordType: "Shop", predicate: cityPredicate)
            let queryOperation = CKQueryOperation(query: query)
            if summary { queryOperation.desiredKeys = ["Description", "Image", "Location", "Name"] }
            queryOperation.recordFetchedBlock = { record in
                shops.append(Shop(partialRecord: record))
            }
            queryOperation.queryCompletionBlock = { (cursor, error) in
                if let error = error {
                    observer.onError(error)
                } else {
                    observer.onNext(shops)
                }
            }
            
            publicDB.addOperation(queryOperation)
            return AnonymousDisposable {
                queryOperation.cancel()
            }
        }
    }

//    static func getNearestShops(location: CLLocation = CLLocation(latitude: 40.7459766, longitude: -74.00466310000002), completion: (result: [Shop]) -> Void){
//        var shops = [Shop]()
//        let predicate = NSPredicate(format: "distanceToLocation:fromLocation:(Location, %@) < 40000000", location)
//        let query = CKQuery(recordType: "Shop", predicate: predicate)
//        publicDB.performQuery(query, inZoneWithID: nil) { results, error in
//            if let results = results {
//                for shop in results {
//                    shops.append(Shop(record: shop))
//                }
//                completion(result: shops)
//            }
//        }
//    }

}
