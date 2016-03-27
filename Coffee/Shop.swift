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
    
class Shop {
    var name = ""
    var city = City()
    var image = UIImage()
    var address = ""
    var neighborhood = ""
    var location = CLLocation()
    var description = ""
    
    static let disposeBag = DisposeBag()
    
//    convenience init(name: String, backgroundImage: String, address: String, coordinates: (latitude: Double, longitude: Double)){
//        self.init()
//        self.name = name
//        self.backgroundImage = backgroundImage
//        self.coordinates = coordinates
//        self.address = address
//    }
    
    convenience init(record: CKRecord) {
        self.init()
        self.name = record.objectForKey("Name") as! String
        self.location = record.objectForKey("Location") as! CLLocation
        self.address = record.objectForKey("Address") as! String
        self.description = (record.objectForKey("Description") as! String).componentsSeparatedByString("\\n").joinWithSeparator("\n")
        let file = record.objectForKey("Image") as! CKAsset
        if let data = NSData(contentsOfURL: file.fileURL), image = UIImage(data: data) {
            self.image = image
        }
        
    }
    
    static func getAllShops(completion: (result: [Shop]) -> Void) {
        CloudKitService.getShops(){ result in
            completion(result: result)
        }
    }
    
    static func getNearestShops(completion: (result: [Shop]) -> Void) {
        CloudKitService.getNearestShops(){ result in
            completion(result: result)
        }
    }
    
    static func sortByLoc(shop1: Shop, shop2: Shop) -> Bool {
        
        LocationService.sharedInstance.locations?.subscribeNext { location in
            return shop2.location.distanceFromLocation(location) > shop1.location.distanceFromLocation(location)
        }.addDisposableTo(disposeBag)
        
//        if let lastKnownLoc = LocationService.sharedInstance.lastKnownLoc {
//            return shop2.location.distanceFromLocation(lastKnownLoc) > shop1.location.distanceFromLocation(lastKnownLoc)
//        }
        
        return false
    }
    
//    static func getFakeData() -> [Shop]{
//        let NYshops = [
//            Shop(name: "Stumptown Coffee Ace Hotel", backgroundImage: "stumptown.jpg", address: "18 W 29th St (at Broadway)", coordinates: (40.7457214, -73.98820790000002)),
//            Shop(name: "Blue Bottle Chelsea",  backgroundImage: "bluebottle.jpg", address: "450 W 15th St (btwn 9th & 10th Ave)", coordinates:  (40.7454906, -74.00576690000003)),
//            Shop(name: "Brooklyn Roasting Company", backgroundImage: "brooklyn.jpg", address: "25 Jay St (btwn Plymouth & John St)", coordinates:  (40.7042686, -73.9863092)),
//            Shop(name: "Intelligentsia", backgroundImage: "intelligentsia.jpg", address: "180 10th Ave (at W 20th & W 21st St)", coordinates:  (40.7459766,-74.00466310000002)),
//            Shop(name: "Laughing Man Coffee", backgroundImage: "laughingman.jpg", address: "184 Duane St (btwn Greenwich & Hudson St.)", coordinates:  (40.7173152, -74.010179)),
//            Shop(name: "Toby's Estate", backgroundImage: "tobysestate.jpg", address: "160 5th Ave (btwn E 20th & E 21st St)", coordinates:  (40.7402786, -73.99108380000001))
//        ]
//        
//        return NYshops
//    }
}
