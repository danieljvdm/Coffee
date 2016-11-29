//
//  APIService.swift
//  Coffee
//
//  Created by Daniel van der Merwe on 11/28/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation
import RxSwift

class APIService {
    let realmService = RealmService()
    let contentfulSerivce: ContentfulService
    
    init() {
        self.contentfulSerivce = ContentfulService(realmService: realmService)
    }
    
    func getShops(for city: City) -> Observable<[Shop]> {
        return realmService.getShops(for: city)
    }
    
    func sync() {
        contentfulSerivce.sync()
    }
    
}
