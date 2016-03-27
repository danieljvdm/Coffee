//
//  ShopsViewModel.swift
//  Coffee
//
//  Created by Daniel on 3/25/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation
import RxSwift

class ShopsViewModel {
    
    var shops: Observable<[Shop]>?
    
    init(){
        shops = getShops()
    }
    
    static func getAllShops(completion: (result: [Shop]) -> Void) {
        CloudKitService.getShops(){ result in
            completion(result: result)
        }
    }
    
    private func getShops() -> Observable<[Shop]>{
        return Observable.create { observer in
            CloudKitService.getShops() { shops in
                observer.onNext(shops)
            }
            
            return AnonymousDisposable {}
        }
    }
    
}