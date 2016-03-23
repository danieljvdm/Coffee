//
//  ShopsCVC.swift
//  Coffee
//
//  Created by Daniel on 3/22/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import UIKit
import BTNavigationDropdownMenu

class ShopsCVC: UICollectionViewController {
    
    var clearTable = false
    var shops = [Shop]()
    let animator = TransitionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        setupNavBar()
        Shop.getNearestShops(){ (shops: [Shop]) in
            self.shops = shops.sort(Shop.sortByLoc)
            dispatch_async(dispatch_get_main_queue()){
                self.collectionView!.reloadData()
            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return clearTable ? 0 : shops.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("shopCell", forIndexPath: indexPath) as! ShopCell
        cell.shop = shops[indexPath.row]
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        collectionView?.reloadData()
    }
    
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ShopsDetailCVC") as! ShopsDetailCVC
        vc.shops = shops
        vc.useLayoutToLayoutNavigationTransitions = true
        navigationController?.pushViewController(vc, animated: true)
    }

    func setupNavBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor.coffeeBlueNav()
        let menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, title: "Near Me", items: ["Near Me", "New York"])
        menuView.cellBackgroundColor = UIColor.coffeeBlue()
        menuView.cellTextLabelFont = UIFont(name: "ProximaNova-Bold", size: 18.0)
        menuView.cellTextLabelAlignment = .Center
        self.navigationItem.titleView = menuView
        
        menuView.didSelectItemAtIndexHandler = {(indexPath: Int) -> () in
            
            print("Did select item at index: \(indexPath)")
            self.clearTable = true
            self.collectionView!.reloadSections(NSIndexSet(index: 0))
            
            let seconds = 1.5
            let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
            let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                self.clearTable = false
                self.collectionView!.reloadSections(NSIndexSet(index: 0))
            })
            //self.selectedCellLabel.text = "Coffee \(cities[indexPath])"
        }
        
    }
    
}

extension ShopsCVC: UINavigationControllerDelegate {
    func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
        if let vc = viewController as? ShopsDetailCVC {
            vc.collectionView!.delegate = vc
            vc.collectionView!.dataSource = vc
        } else {
            collectionView!.delegate = self
            collectionView!.dataSource = self
        }
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .Push {
            return self.animator
        }
        return nil
    }
}

extension ShopsCVC {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width-2, height: collectionView.frame.height/4)
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
