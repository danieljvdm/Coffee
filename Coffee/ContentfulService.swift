//
//  ContentfulService.swift
//  Coffee
//
//  Created by Daniel on 4/2/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxAlamofire
import Alamofire
import SwiftyJSON
import CoreLocation

class ContentfulService {
    private struct Constants {
        static let accessToken = "64686235d65af42171777a17ea98e1f3b2aec649ed687b390636803c8d0051fe"
        static let spaceKey = "sl312cfh6srr"
        static let baseUrl = "https://cdn.contentful.com/spaces/"
        static let fullUrl = "\(baseUrl + spaceKey)/"
    }

    static private let disposeBag = DisposeBag()
    
    static func getShops(city: City, summary: Bool = false) -> Observable<[Shop]> {
        //var shops = [Shop]()
        syncInitial()
        let parameters: [String: AnyObject] = ["access_token" : Constants.accessToken, "content_type" : "shop"]
        let url = Constants.fullUrl + "entries?"
        return Alamofire.request(.GET, url, parameters: parameters)
            .rx_responseJSON()
            .flatMap { response, json -> Observable<[Shop]> in
                var shops = [Shop]()
                let json = JSON(json)
                for(index, subJson) in json["items"]{
                    var newJson = subJson
                    newJson["city"] = json["includes"]["Entry"][Int(index)!]["fields"]
                    newJson["image"] = json["includes"]["Asset"][Int(index)!]["fields"]
                    shops.append(Shop(json: newJson))
                }
                return Observable.just(shops)
            }
    }
    
    static private func syncInitial() {
        let parameters: [String: AnyObject] = ["access_token" : Constants.accessToken, "sync_token" : "w5ZGw6JFwqZmVcKsE8Kow4grw45QdybClR7DjAFKw7PDgcKFHxDCnGnCkB3CjcO6JQXCg8K_wp3CsxzDgy_Cg8Ktw4HCjBLDu8KCLMOMw6NNwodSwrXDrcKPwppCwosVw73Du8KYP8OgRgjCiMKYwp5DQ2k9w6_CmXDCl8KP"]
        let url = Constants.fullUrl + "sync?"
        Alamofire.request(.GET, url, parameters: parameters)
            .rx_responseJSON()
            .subscribeNext { response, json in
                let json = JSON(json)
                print(json)
            }.addDisposableTo(disposeBag)
    }
}


extension Shop {
    convenience init(json: JSON){
        self.init()
        self.name = json["fields"]["name"].stringValue
        self.description = json["fields"]["description"].string
        self.address = json["fields"]["address"].string
        self.neighborhood = json["fields"]["neighborhood"].string
        self.city = City(name: json["city"]["name"].stringValue)
        self.imageURL = json["image"]["file"]["url"].stringValue
        
        let lat = json["fields"]["location"]["lat"].doubleValue 
        let lon = json["fields"]["location"]["lon"].doubleValue
        self.location = CLLocation(latitude: lat, longitude: lon)

    }
}