//
//  Suppliers.swift
//  Northwest PreOrder
//
//  Created by Ambati,Sai Praneeth on 4/5/16.
//  Copyright © 2016 Code Dreamers. All rights reserved.
//
import UIKit
class Suppliers {
    
    var suppliersData:[Supplier]!
    var url:String = "http://codedreamers.atwebpages.com/suppliers.json"
    
    init(){
        self.suppliersData = []
    }
    
    /* Goes out to the designated url, downloads the */
    func populateUniversity(){
        let defaultConfigObject:NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session:NSURLSession = NSURLSession(configuration: defaultConfigObject, delegate: nil, delegateQueue: NSOperationQueue.mainQueue())
        
        session.dataTaskWithURL( NSURL(string: url)!, completionHandler: {(data:NSData?,response:NSURLResponse?,error:NSError?)->Void in
            var supplier:[AnyObject]!
            do {
                try supplier = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [AnyObject]
            for supp in supplier{
                    let supName = supp["supName"]!! as! String
                let supLocation = supp["supLocation"]!! as! String
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
                    
                    
                let supplierInformation = Supplier(supName: supName, supLocation:supLocation)
                    self.suppliersData.append(supplierInformation)
                    
                    print("Suppliers Data count: \(self.suppliersData.count)")
                }
                NSNotificationCenter.defaultCenter().postNotificationName("Data Delivered", object: nil)
            }catch {
                let blamees:[String] = ["Dennis", "Michael", "Charles"]
                print("Something has gone wrong -- I think we'll blame it on \(blamees[random()%blamees.count])")
            }
            
        }).resume()
        
        
        
    }
}