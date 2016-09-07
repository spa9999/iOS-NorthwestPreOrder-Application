//
//  PreOrderProducts.swift
//  Northwest PreOrder
//
//  Created by admin on 4/1/16.
//  Copyright © 2016 Code Dreamers. All rights reserved.
//

import UIKit
class Products {
    
    var selectedSuppliers:String! = ""
    var productData:[Product]!
    var url:String = "http://codedreamers.atwebpages.com/products.json"
    
    init(){
        
        self.productData = []
    }
    
    /* Goes out to the designated url, downloads the */
    func populateProducts(){
        let defaultConfigObject:NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session:NSURLSession = NSURLSession(configuration: defaultConfigObject, delegate: nil, delegateQueue: NSOperationQueue.mainQueue())
        
        session.dataTaskWithURL( NSURL(string: url)!, completionHandler: {(data:NSData?,response:NSURLResponse?,error:NSError?)->Void in
            var product:[AnyObject]!
            do {
                try product = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [AnyObject]
                for prod in product{
                    //let supID = prod["supID"]!! as! Int
                    let supName = prod["supName"]!! as! String
                   // let prodID = prod["prodID"]!! as! Int
                    let prodName = prod["prodName"]!! as! String
                    let prodPrice = prod["prodPrice"]!! as! String
                    let prodDesc = prod["prodDesc"]!! as! String
                    //                    var fineFaculty:[Professor] = []
                    //                    let primaryBuilding = dept["primaryBuilding"]!! as! String
                    //
                    //                    for prof in dept["faculty"] as! [AnyObject] {
                    //                        let firstName = prof["firstName"]!! as! String
                    //                        let lastName = prof["lastName"]!! as! String
                    //                        let office = prof["office"]!! as! String
                    //                        let officeHours = prof["officeHours"]!! as! String
                    //                        let facultyInFormation = Professor(firstName: firstName, lastName: lastName, office: office, officeHours:officeHours, image: UIImage())
                    //                        fineFaculty.append(facultyInFormation)
                    
                    
                   // let productInformation = Product( supName: supName, prodID: prodID, prodName: prodName, prodPrice: prodPrice)
                   
                    let productInformation = Product( supName: supName, prodName: prodName,prodPrice: prodPrice,prodDesc: prodDesc)
                    self.productData.append(productInformation)
                   
                    //print("Suppliers Data count: \(self.productData[0].prodPrice)")
                }
                NSNotificationCenter.defaultCenter().postNotificationName("Data Delivered", object: nil)
            }catch {
                let blamees:[String] = ["Pranu ", "Ambati", "Sai"]
                print("Something has gone wrong -- I think we'll blame it on \(blamees[random()%blamees.count])")
            }
            
        }).resume()
        
        
        
    }
}