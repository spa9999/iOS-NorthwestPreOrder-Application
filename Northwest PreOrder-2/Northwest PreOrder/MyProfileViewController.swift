//
//  MyProfileTabBarController.swift
//  Northwest PreOrder
//
//  Created by Code Dreamers on 3/23/16.
//  Copyright © 2016 Code Dreamers. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {
    var kinveyOperations:KinveyOperations!
    var user:UserSignUp!
    var login:Login!
    var store:KCSAppdataStore!
    var results:[UserSignUp]!
    var userNameFromSeguq:String! = ""
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var editBTNLBL: UIButton!
    @IBOutlet weak var saveBTNLBL: UIButton!
   
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var num_919TF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBAction func editBTN(sender: AnyObject) {
        firstNameTF.enabled = true
        lastNameTF.enabled = true
        //usernameTF.enabled = true
        //num_919TF.enabled = true
        emailTF.enabled = true
        
        // editBTNLBL.userInteractionEnabled = false
        editBTNLBL.hidden = true
        saveBTNLBL.hidden = false
        cancelBTNLBL.hidden = false
        
    }
    
    @IBAction func SAVEBTN(sender: AnyObject) {
//        var error:String = ""
//        var error1:String = ""
//        if firstNameTF.text!.isEmpty{
//            error += "Enter First Name\n"
//            
//            //displayAlertControllerWithTitleforFailure("Fail!", message:"Enter First Name")
//            
//        }
//        if lastNameTF.text!.isEmpty{
//            error += "Enter Last Name\n"
//            //displayAlertControllerWithTitleforFailure("Fail!", message:"Enter Last Name")
//            
//        }
//        if emailTF.text!.isEmpty{
//            error += "Enter Last Name\n"
//            //displayAlertControllerWithTitleforFailure("Fail!", message:"Enter Last Name")
//            
//        }
//        
//        if error != ""{
//            displayAlertControllerWithTitleforFailure("Fail!", message:error)
//        }
//        else{
//            
//            user = UserSignUp(firstName: firstNameTF.text!, lastName: lastNameTF.text!, email: emailTF.text!)
//            kinveyOperations.registerUser(user)
//            
//            displayAlertControllerWithTitle2("Success", message:"Profile Updated!")
//        }
        
        displayAlertControllerWithTitleforFailure("Sorry!", message: "Page Under Development!!")
        
        firstNameTF.enabled = false
        lastNameTF.enabled = false
        //usernameTF.enabled = true
        //num_919TF.enabled = true
        emailTF.enabled = false
        
        // editBTNLBL.userInteractionEnabled = false
        editBTNLBL.hidden = false
        saveBTNLBL.hidden = true
        cancelBTNLBL.hidden = true
    }
    
    @IBOutlet weak var cancelBTNLBL: UIButton!
    @IBAction func cancelBTN(sender: AnyObject) {
        
        firstNameTF.enabled = false
        lastNameTF.enabled = false
        //usernameTF.enabled = true
        //num_919TF.enabled = true
        emailTF.enabled = false
        
        // editBTNLBL.userInteractionEnabled = false
        editBTNLBL.hidden = false
        saveBTNLBL.hidden = true
        cancelBTNLBL.hidden = true
    }
    
    
    func displayAlertControllerWithTitleforFailure(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title,
            message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel,
            handler:{(action:UIAlertAction)->Void in }))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
        
        
    }
    
    func displayAlertControllerWithTitle2(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title,
            message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel,
            handler:{(action:UIAlertAction)->Void in }))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true)
      //  kinveyOperations = KinveyOperations(operationProtocol: self)
        saveBTNLBL.hidden = true
        cancelBTNLBL.hidden = true
        store = KCSAppdataStore.storeWithOptions([ // a store represents a local connection to the cloud data base
            KCSStoreKeyCollectionName : "Users",
        
            
            KCSStoreKeyCollectionTemplateClass : UserSignUp.self
            ])
        let tbvc = tabBarController as! DefaultTabBarController
        self.userNameFromSeguq = tbvc.userNameFromSeguq
      //print("Username:\(userNameFromSeguq)")
    }
    
//    @IBAction func fetchResults(sender:UIButton){
    
    
//        store.loadObjectWithID(
//           "56f1ba9c0f3469727f11106c",
//            withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
//                if errorOrNil == nil {
//                    //NSLog("successful reload: %@", objectsOrNil[0] as! NSObject) // event updated
//                    for obj in objectsOrNil {
//                        print(obj)
//                    }
//                    self.results = objectsOrNil as! [UserSignUp]
//                    
//                    self.firstNameTF.text = self.results[0].firstName
//                    self.lastNameTF.text = self.results[0].lastName
//                    self.usernameTF.text = self.results[0].username
//                    self.num_919TF.text = self.results[0].num_919
//                    self.emailTF.text = self.results[0].email
//                } else {
//                    NSLog("error occurred: %@", errorOrNil)
//                }
//            },
//            withProgressBlock: nil
//        )
      

//    }
    override func viewDidAppear(animated: Bool) {
//        store.loadObjectWithID(
//            "56f1ba9c0f3469727f11106c",
//            withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
//                if errorOrNil == nil {
//                    //NSLog("successful reload: %@", objectsOrNil[0] as! NSObject) // event updated
//                    for obj in objectsOrNil {
//                        print(obj)
//                    }
//                    self.results = objectsOrNil as! [UserSignUp]
//                    
//                    self.firstNameTF.text = self.results[0].firstName
//                    self.lastNameTF.text = self.results[0].lastName
//                    self.usernameTF.text = self.results[0].username
//                    self.num_919TF.text = self.results[0].num_919
//                    self.emailTF.text = self.results[0].email
//                } else {
//                    NSLog("error occurred: %@", errorOrNil)
//                }
//            },
//            withProgressBlock: nil
//        )
        let query = KCSQuery(onField: "username", withExactMatchForValue: userNameFromSeguq)
        store.queryWithQuery(
            query,
            withCompletionBlock: { (objectsOrNil: [AnyObject]!, errorOrNil: NSError!) -> Void in
                if errorOrNil == nil {
                    //NSLog("successful reload: %@", objectsOrNil[0] as! NSObject) // event updated
                    for obj in objectsOrNil {
                        print(obj)
                    }
                    
                    self.results = objectsOrNil as! [UserSignUp]
                    
                    self.firstNameTF.text = self.results[0].firstName
                    self.lastNameTF.text = self.results[0].lastName
                    self.usernameTF.text = self.results[0].username
                    self.num_919TF.text = self.results[0].num_919
                    self.emailTF.text = self.results[0].email
                } else {
                    NSLog("error occurred: %@", errorOrNil)
                }
            },
            withProgressBlock: nil
        )
        
    }
}
