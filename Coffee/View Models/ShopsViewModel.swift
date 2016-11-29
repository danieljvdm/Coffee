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

class ShopsViewModel {
    var shops: Observable<[Shop]>?
    let cities: [City]
    var city = PublishSubject<City>()
    var isLoading = false
    
    init(cities: [City], getShops: @escaping (City) -> Observable<[Shop]>){
        self.cities = cities
        shops = self.city.flatMapLatest(getShops)
    }
}
