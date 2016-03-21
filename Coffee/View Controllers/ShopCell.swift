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
    var shop = Shop(){
        didSet {
            shopTitle.text = shop.name
            backgroundImage.image = shop.image
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //shopTitle.preferredMaxLayoutWidth = self.bounds.width - 40

    }
}
