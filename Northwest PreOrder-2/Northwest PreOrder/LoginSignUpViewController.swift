//
//  ViewController.swift
//  Northwest PreOrder
//
//  Created by Ambati,Sai Praneeth on 3/17/16.
//  Copyright © 2016 Code Dreamers. All rights reserved.
//

import UIKit

class LoginSignUpViewController: UIViewController,OperationProtocol {
    var kinveyOperations:KinveyOperations!
    var user:UserSignUp!
    var login:Login!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.navigationController?.navigationBarHidden = true
        self.navigationItem.setHidesBackButton(true, animated:true)
        kinveyOperations = KinveyOperations(operationProtocol: self)
        
    }
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var num_919TF: UITextField!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Login_SignUpSC(sender: AnyObject) {
        if sender.selectedSegmentIndex == 0{
            LoginView.hidden = false
            signUpView.hidden = true
        }else{
            LoginView.hidden = true
            signUpView.hidden = false
        }
    }
   
    @IBOutlet weak var signUpView: UIView!
    @IBOutlet weak var LoginView: UIView!
    
    
    @IBAction func signUpBTN(sender: AnyObject) {
        
        var error:String = ""
        var error1:String = ""
        
        if firstNameTF.text!.isEmpty{
            error += "Enter First Name\n"
            
            //displayAlertControllerWithTitleforFailure("Fail!", message:"Enter First Name")
            
        }
        if lastNameTF.text!.isEmpty{
            error += "Enter Last Name\n"
            //displayAlertControllerWithTitleforFailure("Fail!", message:"Enter Last Name")
            
        }
        if userNameTF.text!.isEmpty{
            error += "Enter User Name\n"
            //displayAlertControllerWithTitleforFailure("Fail!", message:"Enter UserName")
            
        }
        if passwordTF.text!.isEmpty{
            error += "Enter Password\n"
            //displayAlertControllerWithTitleforFailure("Fail!", message:"Enter Password")
            
        }
        if emailTF.text!.isEmpty{
            error += "Enter Email\n"
            //displayAlertControllerWithTitleforFailure("Fail!", message:"Enter Password")
            
        }
        if num_919TF.text!.isEmpty{
            error += "Enter 919 Number\n"
            //displayAlertControllerWithTitleforFailure("Fail!", message:"Enter Password")
            
        }
        if confirmPasswordTF.text! == ""{
            error += "Enter Confirm Password\n"
            //("Fail!", message:"Enter Confirm Password")
            
        }
        
        
        if passwordTF.text! != confirmPasswordTF.text!{
            
            error1 += error+"Your passwords don't match"
            
        }else if passwordTF.text! == confirmPasswordTF.text!{
            error1 = error
        }
        
        if error1 != "" {
            
            displayAlertControllerWithTitleforFailure("Fail!", message:error1)
            
            
        }
            
            
        else{
        
        user = UserSignUp(firstName: firstNameTF.text!, lastName: lastNameTF.text!, username: userNameTF.text!, password: passwordTF.text!, num_919: num_919TF.text!, email: emailTF.text!)
        kinveyOperations.registerUser(user)
        
        displayAlertControllerWithTitle2("Success", message:"Registration Successful")
        }
        
    }
    @IBAction func loginBTN(sender: AnyObject) {
        var error:String = ""
        
        if userNameTF.text!.isEmpty{
            
            error += error+"Enter Username\n"
            
        }
        if passwordTF.text!.isEmpty{
            error += "Enter Password"
            //displayAlertControllerWithTitleforFailure("Fail!", message:"Enter Password")
            
        }
        
        if error != "" {
            
            displayAlertControllerWithTitleforFailure("Fail!", message:error)
            
            
        }
         else{
        login = Login(userName: userNameTF.text!, password: passwordTF.text!)
        kinveyOperations.loginUser(login)
            
           
        }
    }

    func displayAlertControllerWithTitle(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title,
            message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel,
            handler:  { action in self.performSegueWithIdentifier("success", sender: self) }))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
        
        
        
    }
    
    
    func displayAlertControllerWithTitle2(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title,
            message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel,
            handler:{(action:UIAlertAction)->Void in }))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
        
        
        
    }
    
    func displayAlertControllerWithFailure(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title,
            message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel,
            handler:{(action:UIAlertAction)->Void in }))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
        
        
    }
    func displayAlertControllerWithTitleforFailure(title:String, message:String) {
        let uiAlertController:UIAlertController = UIAlertController(title: title,
            message: message, preferredStyle: UIAlertControllerStyle.Alert)
        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel,
            handler:{(action:UIAlertAction)->Void in }))
        self.presentViewController(uiAlertController, animated: true, completion: nil)
        
        
        
    }
    
    func onError(message: String) {
        displayAlertControllerWithFailure("OOPS!", message:"Login Failed")
        
    }
    func onSuccess() {
        displayAlertControllerWithTitle("Success", message:"Login Successful")
    }
    func noActiveUser() {
        //
    }
    
    func loginFailed() {
        //
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let viewController2 = segue.destinationViewController as? DefaultTabBarController {
            viewController2.userNameFromSeguq = userNameTF.text!
            viewController2.passwordFromSeguq = passwordTF.text!
        }
      
    }
    
    }

