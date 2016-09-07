//
//  HistoryTabBarController.swift
//  Northwest PreOrder
//
//  Created by Code Dreamers on 3/23/16.
//  Copyright © 2016 Code Dreamers. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var kinveyOperations:KinveyOperations!
    var store:KCSAppdataStore!
    var userNameFromSeguq:String! = ""
    var results:[OrderDetails]!
    
    var supName:String!
    //var supLocation:String!
    var prodName:String!
    var totalBill:String!
    var username:String!
    var password:String!
    var quantity:String!
    var orderID:String!
    var supplier:String! = ""
    var orderTime:String!
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.navigationItem.setHidesBackButton(true, animated:false)
       
    }
//    
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//    
//    // sets the title for header in section
//    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Product Details"
//    }
    
  
    
}
