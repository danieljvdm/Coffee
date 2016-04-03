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

class ShopDetailVC: UIViewController {
    
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
        self.bindToViewModel()
        self.configureView()
    }
    
    func bindToViewModel() {
        self.navigationItem.title = viewModel.name
        //self.backgroundImage.image = viewModel.image
        self.tapGestureRecognizer.rx_event
            .subscribeNext { recognizer in
                self.viewModel.openMapsApp()
            }
            .addDisposableTo(disposeBag)

    }
    
    func configureView() {
        updateText()
        mapView.addAnnotation(viewModel.getMapMarker())
        mapView.setRegion(viewModel.getMapRegion(), animated: true)
    }
    
    
    func updateText() {
        addressLabel.updateAttributedText(viewModel.address)
        shopTitleLabel.updateAttributedText(viewModel.name)
        descriptionLabel.updateAttributedText(viewModel.description)
        descriptionLabel.addAttributes([NSFontAttributeName: UIFont.systemFontOfSize(16.0)])
    }
    
    @IBAction func share(sender: AnyObject) {
        displayShareSheet([viewModel.name, viewModel.address])
    }
    
    func displayShareSheet(shareContent:[AnyObject]) {
        let activityViewController = UIActivityViewController(activityItems: shareContent, applicationActivities: nil)
        presentViewController(activityViewController, animated: true, completion: {})
    }

}