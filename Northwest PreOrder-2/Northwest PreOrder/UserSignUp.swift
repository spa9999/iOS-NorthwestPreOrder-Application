//
//  UserSignUp.swift
//  Northwest PreOrder
//
//  Created by Ambati,Sai Praneeth on 3/17/16.
//  Copyright © 2016 Code Dreamers. All rights reserved.
//

import Foundation

class UserSignUp :NSObject {
    
        var username:String!
    var password:String!
    var num_919:String!
    var firstName:String!
    var lastName:String!
    var email:String!
    
   // var askingPrice:NSNumber!
   // var bids:[String]!
    var entityId: String? // Kinvey entity _id -- had to add this
    
    override var description:String {
        return "Details: Username:\(username), password: \(password), 919#: \(num_919), firstname: \(firstName), lastname: \(lastName), email: \(email) "
    }
    init(firstName:String, lastName:String, username:String, password:String, num_919:String, email:String){
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
        self.password = password
        self.num_919 = num_919
        self.email = email
        //activitiesValues = activities.updateActivities(profession)
        //print("********** \(activitiesValues)")
        
    }
    init(firstName:String, lastName:String, username:String, num_919:String, email:String){
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
        self.num_919 = num_919
        self.email = email
        //activitiesValues = activities.updateActivities(profession)
        //print("********** \(activitiesValues)")
        
    }
    
    init(firstName:String, lastName:String, email:String){
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        //activitiesValues = activities.updateActivities(profession)
        //print("********** \(activitiesValues)")
        
    }
    init(username:String)
    {
        self.username = username
    }
    
    
    init(password:String)
    {
        self.password = password
    }
    
    override init() {
        super.init()
    }
    
    init(username:String, password:String, num_919:String, firstName:String, lastName:String, email:String) {
        self.username = username
        self.password = password
        self.num_919 = num_919
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
    
    override func hostToKinveyPropertyMapping() -> [NSObject : AnyObject]! {
        return [
            "entityId" : KCSEntityKeyId, //the required _id field
            "username" : "username",
            "password" : "password",
            "num_919" : "num_919",
            "firstName" : "firstName",
            "lastName" : "lastName",
            "email" : "email"
        ]
    }
    
    
     
    
    
}