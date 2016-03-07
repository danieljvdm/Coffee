    //
//  Shop.swift
//  Coffee
//
//  Created by Daniel on 2/26/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation

class Shop {
    var name = ""
    var location: City?
    var backgroundImage = ""
    var address = "18 W 29th St, New York, NY 10001"

    let coordinates = (latitude: 40.745414, longitude: -73.988334)
    var description = "Stumptown Ace Hotel combines captivating ambiance with delectable coffee. The shop is easily accessible from the street, but customers are more than welcome to sit down in the decadent Ace Hotel lobby to enjoy their brew. \n" + "This particular location features an awesome nitros cold brew that comes out looking like a Guinness from one of Dublin's finest pubs."
    
    convenience init(name: String, backgroundImage: String){
        self.init()
        self.name = name
        self.backgroundImage = backgroundImage
    }
    
    static func getFakeData() -> [Shop]{
        let NYshops = [
            Shop(name: "Stumptown Coffee", backgroundImage: "stumptown.jpg"),
            Shop(name: "Blue Bottle",  backgroundImage: "bluebottle.jpg"),
            Shop(name: "Brooklyn Roasting Company", backgroundImage: "brooklyn.jpg"),
            Shop(name: "Intelligentsia", backgroundImage: "intelligentsia.jpg"),
            Shop(name: "Laughing Man Coffee", backgroundImage: "laughingman.jpg"),
            Shop(name: "Toby's Estate", backgroundImage: "tobysestate.jpg")
        ]
        
        return NYshops
    }
}
