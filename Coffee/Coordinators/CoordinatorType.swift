//
//  Coordinator.swift
//  GameOn
//
//  Created by Daniel on 5/14/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//
import Foundation
import UIKit

protocol CoordinatorType {
    var navCtrl: UINavigationController! {get set}
    var realm: RealmService! {get set}
    init()
    init(root: UINavigationController, realm: RealmService)
    func start()
}

extension CoordinatorType {
    init(root: UINavigationController, realm: RealmService){
        self.init()
        self.navCtrl = root
        self.realm = realm
    }
}
