//
//  ShopDetailVC.swift
//  Coffee
//
//  Created by Daniel on 3/1/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import RxSwift
import RxCocoa

class ShopDetailVC: UIViewController, Injectable {
    
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var shopTitleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!

    let regionRadius: CLLocationDistance = 300
    @IBOutlet weak var descriptionLabel: UILabel!
    let locationManager = CLLocationManager()
    let disposeBag = DisposeBag()

    var viewModel: ShopDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel()
        self.configureView()
    }
    
    func bindViewModel() {
        self.navigationItem.title = viewModel.name
        //self.backgroundImage.image = viewModel.image
        tapGestureRecognizer.rx.event.subscribe(onNext: { (recognizer) in
            self.viewModel.openMapsApp()
        }, onError: nil, onCompleted: nil, onDisposed: nil).addDisposableTo(disposeBag)
        
    }
    
    func configureView() {
        updateText()
        mapView.addAnnotation(viewModel.getMapMarker())
        mapView.setRegion(viewModel.getMapRegion(), animated: true)
    }
    
    
    func updateText() {
        addressLabel.updateAttributedText(viewModel.address)
        shopTitleLabel.updateAttributedText(viewModel.name)
        descriptionLabel.updateAttributedText(viewModel.bio)
        descriptionLabel.addAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 16.0)])
    }
    
    @IBAction func share(_ sender: AnyObject) {
        displayShareSheet([viewModel.name as AnyObject, viewModel.address as AnyObject])
    }
    
    func displayShareSheet(_ shareContent:[AnyObject]) {
        let activityViewController = UIActivityViewController(activityItems: shareContent, applicationActivities: nil)
        present(activityViewController, animated: true, completion: {})
    }

}
