    //
//  Shop.swift
//  Coffee
//
//  Created by Daniel on 2/26/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import Foundation
import CloudKit
import UIKit
import RxSwift
    
class Shop {
    var name = ""
    var city: City?
    var image = UIImage()
    var imageURL: String?
    var address: String?
    var neighborhood: String?
    var location = CLLocation()
    var description: String?
    
    static let disposeBag = DisposeBag()
    
    convenience init(partialRecord: CKRecord) {
        self.init()
        self.name = partialRecord.objectForKey("Name") as! String
        self.location = partialRecord.objectForKey("Location") as! CLLocation
        let file = partialRecord.objectForKey("Image") as! CKAsset
        if let data = NSData(contentsOfURL: file.fileURL), image = UIImage(data: data) {
            self.image = image
        }
        
    }
    
    convenience init(record: CKRecord) {
        self.init()
        self.city = City(name: record.objectForKey("City") as! String)
        self.name = record.objectForKey("Name") as! String
        self.location = record.objectForKey("Location") as! CLLocation
        self.address = record.objectForKey("Address") as? String
        self.description = (record.objectForKey("Description") as! String).componentsSeparatedByString("\\n").joinWithSeparator("\n")
        let file = record.objectForKey("Image") as! CKAsset
        if let data = NSData(contentsOfURL: file.fileURL), image = UIImage(data: data) {
            self.image = image
        }
        
    }
}
