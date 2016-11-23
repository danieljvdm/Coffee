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
import RealmSwift

class ContentfulService {
    fileprivate struct Constants {
        static let accessToken = "64686235d65af42171777a17ea98e1f3b2aec649ed687b390636803c8d0051fe"
        static let spaceKey = "sl312cfh6srr"
        static let baseUrl = "https://cdn.contentful.com/spaces/"
        static let fullUrl = "\(baseUrl + spaceKey)/"
        static let parameters: Parameters = ["access_token" : Constants.accessToken]
    }

    static let sharedService = ContentfulService()
    fileprivate let disposeBag = DisposeBag()
    
    private var syncToken: String? {
        get {
            return UserDefaults.standard.string(forKey: "syncToken")
        }
        set(newToken) {
            UserDefaults.standard.set(newToken, forKey: "syncToken")
            UserDefaults.standard.synchronize()
        }
    }
    
    func sync() {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        let realmManager = RealmService.sharedService
        
        if realmManager.isCorrupt() {
            realmManager.clean()
            self.syncToken = nil
        }
        
        var parameters = Constants.parameters
//        if let token = self.syncToken {
//            parameters.updateValue(token, forKey: "sync_token")
//        } else {
//            parameters.updateValue(true, forKey: "initial")
//        }
        parameters.updateValue(true, forKey: "initial")
        
        let url = Constants.fullUrl + "sync?"
        fetch(with: url, parameters: parameters)
    }
    
    func fetch(with url: String, parameters: Parameters, existingJsonItems: JSON? = nil) {
        let realmManager = RealmService.sharedService
        Alamofire.request(url, parameters: parameters)
            .rx
            .responseJSON()
            .subscribe(onNext: { [weak self] _, json in
                let json = JSON(json)
                var jsonItems = json["items"]
                if let existingJsonItems = existingJsonItems {
                    jsonItems = JSON(jsonItems.arrayObject! + existingJsonItems.arrayObject!)
                }
                
                if let token = json["nextSyncUrl"].string {
                    realmManager.createObjectsFromContentful(json: jsonItems)
                    self?.syncToken = token.replacingOccurrences(of: "\(Constants.fullUrl)sync?sync_token=", with: "")
                } else if let nextPage = json["nextPageUrl"].string {
                    print("getting next page url")
                    let token = nextPage.replacingOccurrences(of: "\(Constants.fullUrl)sync?sync_token=", with: "")
                    var parameters = Constants.parameters
                    parameters.updateValue(token, forKey: "sync_token")
                    self?.fetch(with: url, parameters: parameters, existingJsonItems: jsonItems)
                }
                
            }).addDisposableTo(disposeBag)
    }
}
