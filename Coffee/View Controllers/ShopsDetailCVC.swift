//
//  ShopsDetailCVC.swift
//  Coffee
//
//  Created by Daniel on 3/22/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import UIKit

class ShopsDetailCVC: UICollectionViewController {
    
    var shops = [Shop](){
        didSet {
            collectionView!.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.pagingEnabled = true
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shops.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = self.collectionView!.dequeueReusableCellWithReuseIdentifier("detailCell", forIndexPath: indexPath) as! ShopDetailCell
        cell.backgroundColor = UIColor.redColor()
        cell.shop = shops[indexPath.row]
        // Configure the cell
    
        return cell
    }
}

extension ShopsDetailCVC {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
}
