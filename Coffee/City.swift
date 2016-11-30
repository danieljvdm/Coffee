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
    
    init(realmCity: RealmCity) {
        self.name = realmCity.name
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

extension City: Equatable {
    static func == (lhs: City, rhs: City) -> Bool {
        return lhs.name == rhs.name
    }
}
