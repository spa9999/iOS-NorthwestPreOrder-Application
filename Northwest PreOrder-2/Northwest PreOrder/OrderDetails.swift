//
//  OrderDetails.swift
//  Northwest PreOrder
//
//  Created by Ambati,Sai Praneeth on 4/14/16.
//  Copyright © 2016 Code Dreamers. All rights reserved.
//

import UIKit

class OrderDetails:NSObject {
   // var supID:Int!
    var entityId: String? // Kinvey entity _id -- had to add this
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
    
    override init() {
        super.init()
    }
    
    init(supName:String, prodName:String, totalBill:String, username:String,password:String, quantity:String, orderID:String,orderTime:String ){
        self.supName = supName
        self.prodName = prodName
        self.totalBill = totalBill
        self.username = username
        self.password = password
        self.quantity = quantity
        self.orderID = orderID
        self.orderTime = orderTime
    }
    
//    init(supName:String, supLocation:String){
//        self.supName = supName
//        self.supLocation = supLocation
//    }
    override func hostToKinveyPropertyMapping() -> [NSObject : AnyObject]! {
        return [
            "entityId" : KCSEntityKeyId, //the required _id field
            "supName" : "supName",
            "prodName" : "prodName",
            "totalBill" : "totalBill",
            "username" : "username",
            "quantity" : "quantity",
            "orderID" : "orderID",
            "orderTime" : "orderTime"
        ]
    }
}