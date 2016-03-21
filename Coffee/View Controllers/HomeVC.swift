//
//  HomeVC.swift
//  Coffee
//
//  Created by Daniel on 2/27/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import UIKit
import BTNavigationDropdownMenu
import Hue
import NVActivityIndicatorView
import CoreLocation

class HomeVC: UIViewController {
    
    @IBOutlet weak var activityView: NVActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var shops = [Shop]()
    var clearTable = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.estimatedRowHeight = 60.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "ios-linen.jpg")!)
        self.tableView.backgroundColor = UIColor.clearColor()

        self.activityView.type = .BallScaleRippleMultiple
        
        self.activityView.startAnimation()
        Shop.getNearestShops(){ (shops: [Shop]) in

            self.shops = shops.sort(Shop.sortByLoc)
            dispatch_async(dispatch_get_main_queue()){
                self.activityView.stopAnimation()
                self.tableView.reloadData()
            }
        }
        setupNavBar()
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowShopDetail" {
            if let destination = segue.destinationViewController as? ShopDetailVC {
                if let index = tableView.indexPathForSelectedRow?.row {
                    destination.shop = shops[index]
                }
            }
        }
    }
}

//Navigation Drop Down
extension HomeVC {
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
            self.tableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: .Automatic)
            self.activityView.startAnimation()
            
            let seconds = 1.5
            let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
            let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                self.clearTable = false
                self.tableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: .Automatic)
                self.activityView.stopAnimation()
            })
            //self.selectedCellLabel.text = "Coffee \(cities[indexPath])"
        }

    }
}

//Tableview Datasource
extension HomeVC: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if clearTable {
            return 0
        }
        return shops.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! HomeTableViewCell
        cell.coffeeShop = shops[indexPath.row]
        return cell
    }
}

//Tableview Delegate
extension HomeVC: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
}