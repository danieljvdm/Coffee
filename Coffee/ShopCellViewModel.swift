//
//  ShopCellViewModel.swift
//  Coffee
//
//  Created by Daniel on 3/27/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ShopCellViewModel {
    var shop: Shop
    var distanceFromUser: Observable<String>?
    let disposeBag = DisposeBag()
    
    init(shop: Shop){
        self.shop = shop
        
        distanceFromUser = (LocationService.sharedInstance.locations?
            .map ({
                return self.prettyDistance(self.shop.location.distanceFromLocation($0))
            })
        )
    }
    
    func prettyDistance(distance: Double) -> String {
        if distance >= 1000 {
            let distanceKM =  distance/1000.0
            let roundedDistance = round(distanceKM*100)/100
            return " \(roundedDistance)km "
        } else {
            let distanceM = Int(round(distance))
            return " \(distanceM)m "
        }
    }

}