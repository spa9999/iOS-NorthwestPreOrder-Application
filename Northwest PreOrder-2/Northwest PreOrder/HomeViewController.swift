//
//  HomeTabBarController.swift
//  Northwest PreOrder
//
//  Created by Code Dreamers on 3/23/16.
//  Copyright © 2016 Code Dreamers. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
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
        
        store = KCSAppdataStore.storeWithOptions([ // a store represents a local connection to the cloud data base
            KCSStoreKeyCollectionName : "orders",
            
            
            KCSStoreKeyCollectionTemplateClass : OrderDetails.self
            ])
        
        let tbvc = tabBarController as! DefaultTabBarController
        self.userNameFromSeguq = tbvc.userNameFromSeguq
        
        self.navigationItem.setHidesBackButton(true, animated:false)
        imageView.animationImages = [
            
            UIImage(named:"Cloud 2-1.png")!,
            
            UIImage(named:"Cloud 3.png")!,
            
            UIImage(named:"Cloud 4.png")!,
            
            UIImage(named:"Cloud 5.png")!
            
        ]
        
        
        
        imageView.animationDuration = 8
        
        imageView.startAnimating()
        
        
        store = KCSAppdataStore.storeWithOptions([ // a store represents a local connection to the cloud data base
            KCSStoreKeyCollectionName : "Users",
            
            
            KCSStoreKeyCollectionTemplateClass : UserSignUp.self
            ])

             }
    
    var orderDetails:[OrderDetails]!
    
    @IBOutlet weak var descriptionTV: UITextView!
    
   
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidAppear(animated: Bool) {

        let query = KCSQuery(onField: "username", withExactMatchForValue: userNameFromSeguq)
        store.queryWithQuery(
            query,
            withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
                if errorOrNil == nil {
                    //NSLog("successful reload: %@", objectsOrNil[0] as! NSObject) // event updated
                    for obj in objectsOrNil {
                        print(obj)
                    }
                    
                    self.results = objectsOrNil as! [OrderDetails]
                    
                    print("Array Count: \(self.results.count)")
                    
//                    for data in self.results{
//                        print(data.totalBill)
//                    }
//                    self.supName = self.results[0].supName
//                    self.prodName = self.results[0].prodName
//                    self.totalBill = self.results[0].totalBill
//                    self.orderID = self.results[0].orderID
//                    self.orderTime = self.results[0].orderTime
                } else {
                    NSLog("error occurred: %@", errorOrNil)
                }
            },
            withProgressBlock: nil
        )
        
        
        
    }
}
