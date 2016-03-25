//
//  ShopsVC.swift
//  Coffee
//
//  Created by Daniel on 3/17/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import BTNavigationDropdownMenu
import RxSwift

class ShopsVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityView: NVActivityIndicatorView!
    var clearTable = false
    var shops = [Shop]()
    lazy var vm: ShopsViewModel {
        
    }
    let animator = AnimationService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        Shop.getNearestShops(){ (shops: [Shop]) in
            
            self.shops = shops.sort(Shop.sortByLoc)
            dispatch_async(dispatch_get_main_queue()){
                self.activityView.stopAnimation()
                self.collectionView.reloadData()
            }
        }
        
        setupNavBar()
        // Do any additional setup after loading the view.
    }
    
    func configure() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: "ios-linen.jpg")!)
        collectionView.contentInset = UIEdgeInsetsZero
        
        activityView.type = .BallBeat
        activityView.startAnimation()
    }
    
    override func viewDidAppear(animated: Bool) {
        navigationController?.delegate = self
    }
    
    override func viewDidDisappear(animated: Bool) {
        navigationController?.delegate = nil
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowShopDetail" {
            if let destination = segue.destinationViewController as? ShopDetailVC {
                if let index = collectionView.indexPathsForSelectedItems()?.first?.row {
                    destination.shop = shops[index]
                }
            }
        }
    }

}

extension ShopsVC: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return clearTable ? 0 : shops.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("shopCell", forIndexPath: indexPath) as! ShopCell
        cell.shop = shops[indexPath.row]
        return cell
    }
}

extension ShopsVC: UICollectionViewDelegateFlowLayout {
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

extension ShopsVC {
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
            self.collectionView.reloadSections(NSIndexSet(index: 0))
            self.activityView.startAnimation()
            
            let seconds = 1.5
            let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
            let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                self.clearTable = false
                self.collectionView.reloadSections(NSIndexSet(index: 0))
                self.activityView.stopAnimation()
            })
        }
        
    }
}

extension ShopsVC: UINavigationControllerDelegate {
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .Push {
            return self.animator
        }
        
        return nil
    }
}
