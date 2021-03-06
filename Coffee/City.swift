//
//  City.swift
//  Coffee
//
//  Created by Daniel on 2/29/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation

class City {
    dynamic var name = ""
    var coffeeShops = [Shop]()

    convenience init(name: String){
        self.init()
        self.name = name
    }
    
    static func getFakeData() -> [City] {
        let cities = [
            City(name: "New York"),
            City(name: "Berlin"),
            City(name: "Cape Town"),
            City(name: "London"),
            City(name: "Chicago"),
            City(name: "Los Angeles"),
            City(name: "San Francisco")
        ]
        
        return cities
    }
}
