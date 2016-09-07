//
//  PreOrderDetailedProductViewController.swift
//  Northwest PreOrder
//
//  Created by Ambati,Sai Praneeth on 4/12/16.
//  Copyright © 2016 Code Dreamers. All rights reserved.
//

class PreOrderDetailedProductViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    var selectedSupplier:String! = ""
    var prodName:String! = ""
    var prodDesc:String! = ""
    var prodPrice:String! = ""
    var estPricee:String! = ""
    var prodPricee:Int! = 0
    @IBOutlet weak var quantityPickerView: UIPickerView!
    @IBOutlet weak var prodNameLBL: UILabel!
    @IBOutlet weak var prodDescTV: UITextView!
    @IBOutlet weak var prodPriceLBL: UILabel!
    @IBOutlet weak var EstPriceTF: UITextField!
    
    var quantity = ["1","2","3","4","5","6"]
    var selectedQuantity:Int! = 1
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.navigationItem.setHidesBackButton(true, animated:false)
        self.navigationItem.title = prodName
        quantityPickerView.delegate = self
        quantityPickerView.dataSource = self
        prodPricee = Int(prodPrice)
        estPricee = "\(Double(selectedQuantity*prodPricee))"
        prodNameLBL.text = prodName
        prodDescTV.text = prodDesc
        prodPriceLBL.text = "$\(Double(prodPrice)!)"
        
        EstPriceTF.text = "$\(estPricee)"
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return quantity.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return quantity[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        // use the row to get the selected row from the picker view
        // using the row extract the value from your datasource (array[row])
      
    
        selectedQuantity = Int(quantity[row])
        estPricee = "\(Double(selectedQuantity*prodPricee))"
        EstPriceTF.text = "$\(estPricee)"
        print(selectedQuantity)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dest = segue.destinationViewController as! PreOrderPickUpTimeController
        dest.selectedSupplier = selectedSupplier
        dest.selectedProdName = prodName
        dest.selectedQuantity = selectedQuantity
        dest.estPrice = Double(estPricee)
        
    }
    
}
