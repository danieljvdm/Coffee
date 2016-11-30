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
            .distinctUntilChangeGreaterThan(meters: 100)
            .observeOn(MainScheduler.instance)
            .map { [weak self] in
                guard let `self` = self else { return "" }
                return self.prettyDistance(CLLocation(coordinates: shop.coordinates!).distance(from: $0))
            }
        )
        
    }
    
    func prettyDistance(_ distance: Double) -> String {
        switch distance {
        case 0..<1000:
            return " \(Int(round(distance)))m "
        case 1000..<100000:
            let distanceKM =  distance/1000.0
            let roundedDistance = round(distanceKM*100)/100
            return " \(roundedDistance)km "
        default:
            return " > 100km "
        }
    }
}
