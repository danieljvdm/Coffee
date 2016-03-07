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
    var coffeeShop = Shop() {
        didSet {
            shopTitle.text = " \(coffeeShop.name) "
            backgroundImage.image = UIImage(named: coffeeShop.backgroundImage)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
