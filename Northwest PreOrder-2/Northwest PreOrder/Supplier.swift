//
//  Supplier.swift
//  Northwest PreOrder
//
//  Created by Ambati,Sai Praneeth on 4/5/16.
//  Copyright © 2016 Code Dreamers. All rights reserved.
//

import UIKit


class Supplier {
    var supID:Int!
    var supName:String!
    var supLocation:String!
    var supTiming:String!
    var supDesc:String!
    
    
    init(supID:Int, supName:String, supLocation:String, supTiming:String, supDesc:String ){
        self.supID = supID
        self.supName = supName
        self.supLocation = supLocation
        self.supTiming = supTiming
        self.supDesc = supDesc
    }
    
    init(supName:String, supLocation:String){
        self.supName = supName
        self.supLocation = supLocation
    }
    
}
