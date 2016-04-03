//
//  City.swift
//  Coffee
//
//  Created by Daniel on 2/29/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation

struct City {
    let name: String
    
    init(name: String){
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
