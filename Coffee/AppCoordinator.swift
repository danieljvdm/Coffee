//
//  AppCoordinator.swift
//  Coffee
//
//  Created by Daniel on 5/4/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation

protocol CoordinationDelegate {
}

protocol Coordinated {
    var coordinationDelegate: CoordinationDelegate? {get set}
}

protocol Coordinator {
    
}