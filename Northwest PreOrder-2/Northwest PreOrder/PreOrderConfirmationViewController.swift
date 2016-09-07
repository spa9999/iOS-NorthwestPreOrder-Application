//
//  PreOrderConfirmationViewController.swift
//  Northwest PreOrder
//
//  Created by Ambati,Sai Praneeth on 4/14/16.
//  Copyright © 2016 Code Dreamers. All rights reserved.
//

import UIKit

class PreOrderConfirmationViewController: UIViewController {
    
    var selectedSupplier:String!
    var selectedProdName:String!
    var selectedQuantity:Int!
    var estPrice:Double!
    var selectedHours:Int!
    var selectedMinutes:Int!
    var selectedPeriod:String!
    var orderID:String!
    var username:String!
    
    var orderCount:Int! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.navigationItem.setHidesBackButton(true, animated:false)
        //self.navigationItem.title = "Confirmation"
//        var orderNum = random()%100
        self.orderCount = 0
        orderIDTF.text = "\(orderID)"
        
        pickUpTimeTF.text = "\(selectedHours):\(selectedMinutes) \(selectedPeriod)"
        totalChargedTF.text = "$\(estPrice)"
    }
    
    @IBOutlet weak var orderIDTF: UITextField!
    
    @IBOutlet weak var totalChargedTF: UITextField!
    
    @IBOutlet weak var pickUpTimeTF: UITextField!
}