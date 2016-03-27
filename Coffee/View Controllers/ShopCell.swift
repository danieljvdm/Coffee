//
//  ShopCell.swift
//  Coffee
//
//  Created by Daniel on 3/17/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import UIKit

class ShopCell: UICollectionViewCell {
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var shopTitle: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    var shop = Shop(){
        didSet {
            shopTitle.text = shop.name
            backgroundImage.image = shop.image
            if let lastKnownLoc = LocationService.sharedInstance.lastKnownLoc {
                let distance = shop.location.distanceFromLocation(lastKnownLoc)
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //shopTitle.preferredMaxLayoutWidth = self.bounds.width - 40

    }
}
