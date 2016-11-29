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
    var city = PublishSubject<City>()
    var isLoading = false
    
    init(getShops: @escaping (City) -> Observable<[Shop]>){
        shops = self.city.flatMapLatest(getShops)
    }
}
