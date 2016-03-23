//
//  ShopDetailCell.swift
//  Coffee
//
//  Created by Daniel on 3/22/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import UIKit

class ShopDetailCell: UICollectionViewCell {
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var shop = Shop() {
        didSet {
            backgroundImage.image = shop.image
        }
    }
    
}
