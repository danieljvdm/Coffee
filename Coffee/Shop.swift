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
        self.name = partialRecord.object(forKey: "Name") as! String
        self.location = partialRecord.object(forKey: "Location") as! CLLocation
        let file = partialRecord.object(forKey: "Image") as! CKAsset
        if let data = try? Data(contentsOf: file.fileURL), let image = UIImage(data: data) {
            self.image = image
        }
        
    }
    
    convenience init(record: CKRecord) {
        self.init()
        self.city = City(name: record.object(forKey: "City") as! String)
        self.name = record.object(forKey: "Name") as! String
        self.location = record.object(forKey: "Location") as! CLLocation
        self.address = record.object(forKey: "Address") as? String
        self.description = (record.object(forKey: "Description") as! String).components(separatedBy: "\\n").joined(separator: "\n")
        let file = record.object(forKey: "Image") as! CKAsset
        if let data = try? Data(contentsOf: file.fileURL), let image = UIImage(data: data) {
            self.image = image
        }
        
    }
}
