//
//  ShopCell.swift
//  Coffee
//
//  Created by Daniel on 3/17/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ShopCell: UICollectionViewCell {
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var shopTitle: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    let disposeBag = DisposeBag()
    var vm: ShopCellViewModel? {
        didSet {
            shopTitle.text = vm!.shop?.name
            backgroundImage.image = vm!.shop?.image
            vm!.distanceFromUser?.bindTo(distanceLabel.rx_text)
                .addDisposableTo(disposeBag)
        }
    }
}
