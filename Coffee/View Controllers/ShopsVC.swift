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
import RxCocoa

class ShopsVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityView: NVActivityIndicatorView!
    var clearTable = false
    let viewModel = ShopsViewModel()
    let disposeBag = DisposeBag()

    let animator = AnimationService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindToViewModel()
        configureView()
    }
    
    func configureView() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: "ios-linen.jpg")!)
        collectionView.contentInset = UIEdgeInsetsZero
        
        activityView.type = .BallBeat
        activityView.startAnimation()

        setupNavBar()

    }
    
    func bindToViewModel() {
        viewModel.shops?
            .observeOn(MainScheduler.instance)
            .bindTo(collectionView.rx_itemsWithCellIdentifier("shopCell", cellType: ShopCell.self)){ (row, element, cell) in
                cell.viewModel = ShopCellViewModel(shop: element)
            }
            .addDisposableTo(disposeBag)
        
        collectionView.rx_itemSelected.subscribeNext { indexpath in
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ShopDetail") as! ShopDetailVC
            vc.viewModel = ShopDetailViewModel(shop: try! self.collectionView.rx_modelAtIndexPath(indexpath))
            self.navigationController?.pushViewController(vc, animated: true)
            }
            .addDisposableTo(disposeBag)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        navigationController?.delegate = self
    }
    
    override func viewDidDisappear(animated: Bool) {
        navigationController?.delegate = nil
    }

}

extension ShopsVC {
    //To be replaced with real data
    func setupNavBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor.coffeeBlueNav()
        let cities = [City(name: "New York"), City(name: "Cape Town")]
        let menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, title: "Near Me", items: ["Near Me"] + cities.map{$0.name})
        menuView.cellBackgroundColor = UIColor.coffeeBlue()
        menuView.cellTextLabelFont = UIFont(name: "ProximaNova-Bold", size: 18.0)
        menuView.cellTextLabelAlignment = .Center
        self.navigationItem.titleView = menuView
        
        menuView.didSelectItemAtIndexHandler = {(indexPath: Int) -> () in
            self.viewModel.city.onNext(cities[indexPath-1])
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
