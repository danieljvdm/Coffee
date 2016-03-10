//
//  HomeTableViewCell.swift
//  Coffee
//
//  Created by Daniel on 2/29/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var shopTitle: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
    var coffeeShop = Shop() {
        didSet {
            shopTitle.text = " \(coffeeShop.name) "
            backgroundImage.image = coffeeShop.image
            if let lastKnownLoc = LocationService.sharedInstance.lastKnownLoc {
                let distance = coffeeShop.location.distanceFromLocation(lastKnownLoc)
                distanceLabel.text = prettyDistance(distance)
            } else {
                distanceLabel.text = ""
            }
        }
    }
    
    func prettyDistance(distance: Double) -> String {
        if distance >= 1000 {
            let distanceKM =  distance/1000.0
            let roundedDistance = round(distanceKM*100)/100
            return " \(roundedDistance)km "
        } else {
            let distanceM = Int(round(distance))
            return " \(distanceM)m "
        }
    }

}
