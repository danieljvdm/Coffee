//
//  HomeCoordinator.swift
//  Coffee
//
//  Created by Daniel van der Merwe on 11/24/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

final class HomeCoordinator: CoordinatorType {
    var navCtrl: UINavigationController!
    var api: APIService!
    fileprivate let disposeBag = DisposeBag()
    
    func start() {
        presentHomeScreen()
    }
    
    func presentHomeScreen() {
        guard var vc = R.storyboard.main.homeScreen() else { return }
        vc.delegate = self
        let vm = ShopsViewModel(cities: api.getCities(), getShops: api.getShops)
        vc.inject(viewModel: vm)
        navCtrl.pushViewController(vc, animated: false)
    }
    
    func pushShopDetail(_ shop: Shop) {
        guard var vc = R.storyboard.main.shopDetail() else { return }
        vc.inject(viewModel: ShopDetailViewModel(shop: shop))
        navCtrl.pushViewController(vc, animated: true)
    }
}

extension HomeCoordinator: ShopsDelegate {
    func didSelectShop(_ shop: Shop) {
        pushShopDetail(shop)
    }
}
