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
    var api: APIService! {get set}
    init()
    init(root: UINavigationController, api: APIService)
    func start()
}

extension CoordinatorType {
    init(root: UINavigationController, api: APIService){
        self.init()
        self.navCtrl = root
        self.api = api
    }
}
