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
        
        descriptionLabel.updateAttributedText(shop.description)
        addressLabel.addAttributes([NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue])
        
        locationManager.delegate = self
        
        mapView.delegate = self
        let location = CLLocation(latitude: 40.745414, longitude: -73.988334)
        centerMapOnLocation(location)
        let point = MKPointAnnotation()
        point.coordinate = location.coordinate
        point.title = shop.name
        point.subtitle = "310 W 29th St"
        mapView.addAnnotation(point)
        
        // Do any additional setup after loading the view.
    }
    
    
    func styleText() {
//        let fontAttr = [NSFontAttributeName: UIFont(name: "ProximaNova-Regular", size: 16)!]
//        
//        let addressAttrString =  NSMutableAttributedString(string: addressLabel.text!)
//        addressAttrString.addAttribute(NSUnderlineStyleAttributeName, value: 1, range: NSMakeRange(0, addressAttrString.length))
//        addressAttrString.addAttributes(fontAttr, range: NSMakeRange(0, addressAttrString.length))
//        addressLabel.attributedText = addressAttrString
//        
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineSpacing = 3.0
//        paragraphStyle.paragraphSpacing = 10.0
//        
//        let descriptionAttString = NSMutableAttributedString(string: shop.description)
//        descriptionAttString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, descriptionAttString.length))
//        
//        descriptionLabel.attributedText = descriptionAttString

        
    }
    
    @IBAction func addressTapped(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://maps.apple.com/?ll=\(shop.coordinates.latitude),\(shop.coordinates.longitude)")!)
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

extension UILabel {
    func updateAttributedText(text: String) {
        guard let labelText = self.attributedText else {
            return
        }
        
        let existingAttributes = labelText.attributesAtIndex(0, effectiveRange: nil)
        self.attributedText = NSAttributedString(string: text, attributes: existingAttributes)
    }
    
    func addAttributes(attributes: [String: AnyObject]){
        guard let labelText = self.attributedText else {
            return
        }
        
        var existingAttributes = labelText.attributesAtIndex(0, effectiveRange: nil)
        existingAttributes.merge(attributes)
        self.attributedText = NSAttributedString(string: labelText.string, attributes: existingAttributes)
    }
}

extension Dictionary {
    mutating func merge<K, V>(dict: [K: V]){
        for (k, v) in dict {
            self.updateValue(v as! Value, forKey: k as! Key)
        }
    }
}

extension ShopDetailVC: CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0]
        let long = userLocation.coordinate.longitude;
        let lat = userLocation.coordinate.latitude;
        print(long + lat)
    }
}


extension ShopDetailVC: MKMapViewDelegate {
//    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
//        
//    }
}