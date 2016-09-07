//
//  Product.swift
//  Northwest PreOrder
//
//  Created by Ambati,Sai Praneeth on 4/7/16.
//  Copyright © 2016 Code Dreamers. All rights reserved.
//


import UIKit


class Product {
    var supID:Int!
    var supName:String!
    var prodID:Int!
    var prodName:String!
    var prodPrice:String!
    var prodDesc:String!
    
    
    init(supName:String, prodName:String, prodPrice:String,prodDesc:String){
       // self.supID = supID
        self.supName = supName
        //self.prodID = prodID
        self.prodName = prodName
        self.prodPrice = prodPrice
        self.prodDesc = prodDesc
    }
    
   
    
}
