//
//  AppCoordinator.swift
//  Coffee
//
//  Created by Daniel van der Merwe on 11/24/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation
import RxSwift

final class AppCoordinator: CoordinatorType {
    var navCtrl: UINavigationController!
    var api: APIService!
    fileprivate let disposeBag = DisposeBag()
    var coordinators = [CoordinatorType]()
    
    func start() {
        api.sync()
        presentHome()
    }
    
    func presentHome() {
        let coordinator = HomeCoordinator(root: navCtrl, api: api)
        coordinators.append(coordinator)
        coordinator.start()
    }
}
