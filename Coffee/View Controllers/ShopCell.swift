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
    
    var viewModel: ShopCellViewModel! {
        didSet {
            bindToViewModel()
        }
    }
    
    func bindToViewModel() {
        shopTitle.text = viewModel.shop.name
        backgroundImage.image = viewModel.shop.image
        //This will update the distance from label in real time
        viewModel.distanceFromUser?.bindTo(distanceLabel.rx_text)
            .addDisposableTo(disposeBag)
    }
}
