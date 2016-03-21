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

class ShopDetailVC: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var shopTitleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    let regionRadius: CLLocationDistance = 300
    @IBOutlet weak var descriptionLabel: UILabel!
    let locationManager = CLLocationManager()


    var shop = Shop(){
        didSet {
            self.navigationItem.title = shop.name
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImage.image = shop.image
        updateText()
        
        mapView.delegate = self
        let location = shop.location
        centerMapOnLocation(location)
        let point = MKPointAnnotation()
        point.coordinate = location.coordinate
        point.title = shop.name
        point.subtitle = "310 W 29th St"
        mapView.addAnnotation(point)
        
        // Do any additional setup after loading the view.
    }
    
    
    func updateText() {
        addressLabel.updateAttributedText(shop.address)
        addressLabel.addAttributes([NSFontAttributeName: UIFont(name: "ProximaNova-Regular", size: 16)!, NSForegroundColorAttributeName: UIColor.hex("007AFF")])
        shopTitleLabel.updateAttributedText(shop.name)
        shopTitleLabel.addAttributes([NSFontAttributeName: UIFont(name: "ProximaNova-Semibold", size: 22)!])
        descriptionLabel.updateAttributedText(shop.description)
        descriptionLabel.addAttributes([NSFontAttributeName: UIFont(name: "ProximaNova-Regular", size: 16)!])
    }
    
    @IBAction func addressTapped(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://maps.apple.com/?ll=\(shop.location.coordinate.latitude),\(shop.location.coordinate.longitude)")!)
    }
    
    @IBAction func share(sender: AnyObject) {
        displayShareSheet([shop.name, shop.address])
    }
    
    func displayShareSheet(shareContent:[AnyObject]) {
        let activityViewController = UIActivityViewController(activityItems: shareContent, applicationActivities: nil)
        presentViewController(activityViewController, animated: true, completion: {})
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

}

extension Dictionary {
    mutating func merge<K, V>(dict: [K: V]){
        for (k, v) in dict {
            self.updateValue(v as! Value, forKey: k as! Key)
        }
    }
}


extension ShopDetailVC: MKMapViewDelegate {
//    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
//        
//    }
}