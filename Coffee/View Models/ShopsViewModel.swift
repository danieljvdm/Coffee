//
//  ShopsViewModel.swift
//  Coffee
//
//  Created by Daniel on 3/25/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

typealias API = ContentfulService
typealias DefinitionSearchResult = String

class ShopsViewModel {
    var shops: Observable<[Shop]>?
    var city = PublishSubject<City>()
    var isLoading = false
    
    init(){
        shops = self.city
            .flatMapLatest { _ in RealmService.sharedService.getAllShops() }        
    }

}
