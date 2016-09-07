//
//  PreOrderPickUpTimeController.swift
//  Northwest PreOrder
//
//  Created by Ambati,Sai Praneeth on 4/13/16.
//  Copyright © 2016 Code Dreamers. All rights reserved.
//

import UIKit
class PreOrderPickUpTimeController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate,OperationProtocol {
    var order:OrderDetails!
     var kinveyOperationsOrders:KinveyOperations!
    var selectedSupplier:String!
    var selectedProdName:String!
    var selectedQuantity:Int!
    var estPrice:Double!
    var userNameFromSeguq:String!
    var orderID:String!
    var passwordFromSeguq:String!
    var orderTime:String!
    
    var orderCount:Int!
    @IBOutlet weak var minutesPickerView: UIPickerView!
    @IBOutlet weak var hoursPickerView: UIPickerView!
    @IBOutlet weak var orderDetailsTV: UITextView!
    @IBOutlet weak var periodPickerView: UIPickerView!
    
     var hours = ["1","2","3","4","5","6","7","8","9","10","11","12"]
     var minutes = ["05","10","15","20","25","30","35","40","45","50","55"]
    var period = ["AM","PM"]
    
    var selectedHours:Int! = 1
    var selectedMinutes:Int! = 05
    var selectedPeriod:String! = "AM"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tbvc = tabBarController as! DefaultTabBarController
        self.userNameFromSeguq = tbvc.userNameFromSeguq
        self.passwordFromSeguq = tbvc.passwordFromSeguq
        self.orderCount = 0
       // self.navigationItem.setHidesBackButton(true, animated:false)
        //self.navigationItem.title = "Pick Up Time"
        hoursPickerView.delegate = self
        hoursPickerView.dataSource = self
        minutesPickerView.dataSource = self
        minutesPickerView.delegate = self
        periodPickerView.dataSource = self
        periodPickerView.delegate = self
        
        orderDetailsTV.text = "Product Name: \(selectedProdName) \n Quantity: \(selectedQuantity) \n Estimated Price: \(estPrice) "
         kinveyOperationsOrders = KinveyOperations(operationProtocol: self)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 1){
            return hours.count
        }else if (pickerView.tag == 2){
            return minutes.count
        }
        else{
            return period.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if (pickerView.tag == 1){
            return "\(hours[row])"
        }else if (pickerView.tag == 2){
            return "\(minutes[row])"
        }
        else{
            return "\(period[row])"
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        // use the row to get the selected row from the picker view
        // using the row extract the value from your datasource (array[row])
        
        if(pickerView.tag == 1){
        selectedHours = Int(hours[row])
        }
        else if(pickerView.tag == 2){
        selectedMinutes = Int(minutes[row])
        }
        else{
             selectedPeriod = period[row]
        }
       
        
        //EstPriceTF.text = String(Double(selectedQuantity*Int(prodPrice)!))
        print(selectedHours)
        print(selectedPeriod)
        print(selectedMinutes)
    }

    @IBAction func confirmBTN(sender: AnyObject) {
        if orderCount == 0{
        var orderNum = arc4random()%100
        orderID = "\(orderNum)"
        var estPrice1:String! = "\(estPrice)"
        var quantity1:String! = "\(selectedQuantity)"
        orderTime = "\(selectedHours):\(selectedMinutes) \(selectedPeriod)"
        order = OrderDetails(supName: selectedSupplier, prodName: selectedProdName, totalBill: estPrice1, username: userNameFromSeguq,password: passwordFromSeguq, quantity: quantity1, orderID: orderID, orderTime: orderTime)
       print(order.supName)
        print(order.prodName)
        print(order.totalBill)
        print(order.username)
        print(order.password)
        print(order.quantity)
        print(order)
        kinveyOperationsOrders.updateOrder(order)
       displayAlertControllerWithTitle("Success", message:"Order Details Updated")
            
            self.orderCount = 1
        }
        else{
            displayAlertControllerWithTitle2("Sorry", message:"Only one order per day for Now!!")
        }

    }
    
//    func displayAlertControllerWithTitle2(title:String, message:String) {
//        let uiAlertController:UIAlertController = UIAlertController(title: title,
//            message: message, preferredStyle: UIAlertControllerStyle.Alert)
//        uiAlertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel,
//            handler:{(action:UIAlertAction)->Void in }))
//        self.presentViewController(uiAlertController, animated: true, completion: nil)
//        
//        
//        
//        
//    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dest = segue.destinationViewController as! PreOrderConfirmationViewController
        dest.selectedSupplier = selectedSupplier
        dest.selectedProdName = selectedProdName
        dest.selectedQuantity = selectedQuantity
        dest.estPrice = estPrice
        dest.selectedHours = selectedHours
        dest.selectedMinutes = selectedMinutes
        dest.selectedPeriod = selectedPeriod
        dest.orderID = orderID
        dest.username = userNameFromSeguq
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

}