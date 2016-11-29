//
//  RealmService.swift
//  Coffee
//
//  Created by Daniel van der Merwe on 11/23/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift
import SwiftyJSON
import GeoQueries
import RxRealm

class RealmService {
    fileprivate let disposeBag = DisposeBag()
    
    func createObjectsFromContentful(json: JSON, initial: Bool = false) {
        DispatchQueue.main.async {
            let realm = try! Realm()
            
            var shops = [RealmShop]()
            var cities = [RealmCity]()
            var images = [RealmPhoto]()
            
            for (_, subJson) in json {
                let sysJson = subJson["sys"]
                if sysJson["type"].stringValue == "Entry" {
                    switch sysJson["contentType"]["sys"]["id"] {
                    case "city":
                        let entry = RealmCity()
                        entry.id = sysJson["id"].stringValue
                        entry.name = subJson["fields"]["name"]["en-US"].stringValue
                        cities.append(entry)
                        break
                    case "shop":
                        let entry = RealmShop()
                        let fields = subJson["fields"]

                        entry.id = sysJson["id"].stringValue
                        entry.name = fields["name"]["en-US"].stringValue
                        entry.address = fields["address"]["en-US"].string
                        entry.neighborhood = fields["neighborhood"]["en-US"].string
                        entry.longitude.value = fields["coordinates"]["en-US"]["lon"].double
                        entry.latitude.value = fields["coordinates"]["en-US"]["lat"].double
                        entry.bio = fields["description"]["en-US"].string
                        
                        if let imageId = fields["image"]["en-US"]["sys"]["id"].string {
                            if let photo = realm.object(ofType: RealmPhoto.self, forPrimaryKey: imageId) {
                                entry.image = photo
                            } else {
                                let image = RealmPhoto()
                                image.id = imageId
                                entry.image = image
                            }
                        }
                        
                        if let cityId = fields["city"]["en-US"]["sys"]["id"].string {
                            if let city = realm.object(ofType: RealmCity.self, forPrimaryKey: cityId) {
                                entry.city = city
                            } else {
                                let city = RealmCity()
                                city.id = cityId
                                entry.city = city
                            }
                        }
                        
                        shops.append(entry)
                        break
    
                    default: break
                    }
                    
                    continue
                }
                
                if sysJson["type"].stringValue == "DeletedEntry" {
                    switch sysJson["contentType"]["sys"]["id"] {
                    case "city":
                        if let entry = realm.object(ofType: RealmCity.self, forPrimaryKey: sysJson["id"].stringValue) {
                            try! realm.write {
                                realm.delete(entry)
                            }
                        }
                        break
                    case "shop":
                        if let entry = realm.object(ofType: RealmShop.self, forPrimaryKey: sysJson["id"].stringValue) {
                            try! realm.write {
                                realm.delete(entry)
                            }
                        }
                        break
                        
                    default: break
                    }
                }
                
                if subJson["sys"]["type"].stringValue == "Asset" {
                    let fields = subJson["fields"]
                    let asset = RealmPhoto()
                    asset.id = subJson["sys"]["id"].stringValue
                    asset.title = fields["title"]["en-US"].stringValue
                    asset.filePath = fields["file"]["en-US"]["url"].stringValue.replacingOccurrences(of: "//", with: "https://")
                    images.append(asset)
                }

            }
            
            if shops.count > 0 {
                try! realm.write {
                    realm.add(shops, update: true)
                    if cities.count > 0 {
                        realm.add(cities, update: true)
                    }
                    if images.count > 0 {
                        realm.add(images, update: true)
                    }
                }
            }
        }
    }
    
    func getAllShops() -> Observable<[Shop]> {
        let realm = try! Realm()
        let shops = realm.objects(RealmShop.self)
        return Observable.just(shops.map(Shop.init))
    }
    
    func getShops(for city: City) -> Observable<[Shop]>{
        if city.name == "Near Me" {
            return getNearestShops()
        }
        let realm = try! Realm()
        let shops = realm.objects(RealmShop.self).filter(NSPredicate(format: "city.name == %@", city.name))
        return Observable.just(shops.map(Shop.init))
    }
    
    func getNearestShops() -> Observable<[Shop]> {
        return LocationService.sharedInstance.locations?
            .distinctUntilChangeGreaterThan(meters: 100)
            .flatMapLatest({ location -> Observable<[Shop]> in
            let realm = try! Realm()
            let shops = realm.findInRegion(type: RealmShop.self, region: location.region(with: 5000.0), latitudeKey: "latitude", longitudeKey: "longitude")
            let test = shops.sortByDistance(center: location.coordinate, ascending: true, latitudeKey: "latitude", longitudeKey: "longitude")
            
            return Observable.just(test.map(Shop.init))
            
//            let obs = Observable.arrayFrom(shops)
//            let lol = obs.map { shops in
//                shops.map(Shop.init)
//            }
//            
//            return lol
        }) ?? Observable.just([Shop]())
    }
    
    func getCities() -> [City] {
        return try! Realm()
            .objects(RealmCity.self)
            .map(City.init)
    }

    func isCorrupt() -> Bool {
        let realm = try! Realm()
        let photos = realm.objects(RealmPhoto.self)
        let results = photos.filter(NSPredicate(format: "filePath == %@", ""))
        if results.count > 0 {
            print("corrupt")
            return true
        }
        return false
    }
    
    func clean() {
        let realm = try! Realm()
        try! realm.write {
            let allShops = realm.objects(RealmShop.self)
            let allCities = realm.objects(RealmCity.self)
            let allPhotos = realm.objects(RealmPhoto.self)
            realm.delete(allShops)
            realm.delete(allCities)
            realm.delete(allPhotos)
        }
    }

}
