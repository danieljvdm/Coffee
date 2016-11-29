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
import AlamofireImage

class ShopCell: UICollectionViewCell {
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var shopTitle: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    fileprivate let disposeBag = DisposeBag()
    
    var viewModel: ShopCellViewModel! {
        didSet {
            bindToViewModel()
        }
    }
    
    func bindToViewModel() {
        shopTitle.text = viewModel.shopTitle
        if let url = viewModel.imageUrl {
            backgroundImage.af_setImage(withURL: url)
        }
        //This will update the distance from label in real time
        viewModel.distanceFromUser?.bindTo(distanceLabel.rx.text)
            .addDisposableTo(disposeBag)
    }
}
