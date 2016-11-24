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
import Alamofire
import MapKit

class ShopCellViewModel {
    let shopTitle: String
    let imageUrl: URL?
    var distanceFromUser: Observable<String>?
    let disposeBag = DisposeBag()
    
    init(shop: Shop){
        self.shopTitle = shop.name
        self.imageUrl = shop.image?.toUrl()
        
        distanceFromUser = (LocationService.sharedInstance.locations?
            .map ({
                return self.prettyDistance(CLLocation(coordinates: shop.coordinates!).distance(from: $0))
            })
        )
        
    }
    
    func prettyDistance(_ distance: Double) -> String {
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
