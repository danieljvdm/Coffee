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

protocol ShopsDelegate: class {
    func didSelectShop(_: Shop)
}

class ShopsVC: UIViewController, Injectable, Reactive {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityView: NVActivityIndicatorView!
    var clearTable = false
    var viewModel: ShopsViewModel!
    let disposeBag = DisposeBag()

    weak var delegate: ShopsDelegate?
    
    let animator = AnimationService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModel()
        configureView()
    }
    
    func configureView() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: "ios-linen.jpg")!)
        collectionView.contentInset = UIEdgeInsets.zero
        
        activityView.type = .ballBeat
        activityView.startAnimating()

        setupNavBar()

    }
    
    func bindViewModel() {
        viewModel.shops?
            .observeOn(MainScheduler.instance)
            .bindTo(collectionView.rx.items(cellIdentifier: "shopCell", cellType: ShopCell.self)) { (row, element, cell) in
                cell.viewModel = ShopCellViewModel(shop: element)
            }
            .addDisposableTo(disposeBag)
        
        collectionView.rx.itemSelected
            .subscribe(onNext: { indexpath in
                self.delegate?.didSelectShop(try! self.collectionView.rx.model(at: indexpath))
//                guard let vc = R.storyboard.main.shopDetail() else { return }
//                vc.viewModel = ShopDetailViewModel(shop: try! self.collectionView.rx.model(at: indexpath))
//                self.navigationController?.pushViewController(vc, animated: true)
            }).addDisposableTo(disposeBag)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.delegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.delegate = nil
    }

}

extension ShopsVC {
    //To be replaced with real data
    func setupNavBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor.coffeeBlueNav()
        let cities = [City(name: "New York"), City(name: "Cape Town")]
        let items = ["Near Me"] + cities.map{$0.name}
        let menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, title: "Near Me", items: items as [AnyObject])
        menuView.cellBackgroundColor = UIColor.coffeeBlue()
        menuView.cellTextLabelFont = UIFont(name: "ProximaNova-Bold", size: 18.0)
        menuView.cellTextLabelAlignment = .center
        self.navigationItem.titleView = menuView
        
        menuView.didSelectItemAtIndexHandler = {(indexPath: Int) -> () in
            self.viewModel.city.onNext(cities[indexPath-1])
        }
    }
}

extension ShopsVC: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return self.animator
        }
        
        return nil
    }
}

extension ShopsVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width-2, height: collectionView.frame.height/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
