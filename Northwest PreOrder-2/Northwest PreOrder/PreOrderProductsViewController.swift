//
//  PreOrderProductsViewController.swift
//  Northwest PreOrder
//
//  Created by Ambati,Sai Praneeth on 4/7/16.
//  Copyright © 2016 Code Dreamers. All rights reserved.
//
import UIKit
class PreOrderProductsViewController: UITableViewController {
    var rowCount:Int! = 0
    var selectedSupplier:String!
    // var kinveyOperations:KinveyOperations!
    //var store:KCSAppdataStore!
    var selectedProducts:[Product]!
    var products: Products!
    override func viewDidLoad() {
        super.viewDidLoad()
//        products = Products()
//        selectedProducts = []
//        products.populateProducts()
//        
//        
//        for data in products.productData{
////            if data.supName == selectedSupplier{
////                print("data : \(data.prodName)")
////                //selectedProducts.append(data)
////            }
//            print(data.prodID)
//            
//        }
       // print("count \(selectedProducts.count)")
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reloadData:", name: "Data Delivered", object: nil)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.navigationItem.title = "Products"
    }
    
    override func viewWillAppear(animated: Bool) {
        products = Products()
        selectedProducts = []
        products.populateProducts()
        
        
        for data in products.productData{
                        if data.supName == selectedSupplier{
                            print("data : \(data.prodName)")
                            //selectedProducts.append(data)
                        }
            print(data.prodID)
            
        }
        print("count \(selectedProducts.count)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    // sets the title for header in section
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Product Details"
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(products.productData.count)
        for data in products.productData{
            print(data.prodName)
        }
        if(products.productData == nil){
            return 0
        }
        else{
           
            return products.productData.count
            
        }
    }
    func reloadData(data: NSNotification){
        tableView.reloadData()
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        // Configure the cell...
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("product_cell", forIndexPath: indexPath)
         if(products.productData[indexPath.row].supName == selectedSupplier){
        cell.textLabel!.text = products.productData[indexPath.row].prodName
        cell.detailTextLabel!.text = "$\(products.productData[indexPath.row].prodPrice)"
        return cell
        }
         else{
            cell.textLabel!.text = "No Products Found!!"
            
            return cell
        }
    }
    
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            let dest = segue.destinationViewController as! PreOrderDetailedProductViewController
            let row = tableView.indexPathForSelectedRow?.row
            dest.prodName = products.productData[row!].prodName
            dest.prodDesc = products.productData[row!].prodDesc
            dest.prodPrice = products.productData[row!].prodPrice
            dest.selectedSupplier = selectedSupplier
        }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}

//  override func viewDidLoad() {
//   super.viewDidLoad()
//  self.navigationItem.setHidesBackButton(true, animated:true)
//  kinveyOperations = KinveyOperations(operationProtocol: self)

//        store = KCSAppdataStore.storeWithOptions([ // a store represents a local connection to the cloud data base
//            KCSStoreKeyCollectionName : "suppliers",
//            KCSStoreKeyCollectionTemplateClass : PreOrderProducts.self
//            ])

//  }
//}
