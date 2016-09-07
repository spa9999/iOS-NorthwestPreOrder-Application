//
//  PreOrderTabBarController.swift
//  Northwest PreOrder
//
//  Created by Code Dreamers on 3/23/16.
//  Copyright © 2016 Code Dreamers. All rights reserved.
//

import UIKit

class PreOrderViewController: UITableViewController {
   // var kinveyOperations:KinveyOperations!
    //var store:KCSAppdataStore!

    var suppliers: Suppliers!
    override func viewDidLoad() {
        super.viewDidLoad()
        suppliers = Suppliers()
        suppliers.populateUniversity()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reloadData:", name: "Data Delivered", object: nil)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.navigationItem.title = "Suppliers"
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
        return "Food Suppliers"
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(suppliers.suppliersData.count)
        for data in suppliers.suppliersData{
            print(data.supName)
        }
       if(suppliers.suppliersData == nil){
          return 0
        }
       else{
            return suppliers.suppliersData.count
        }
    }
    func reloadData(data: NSNotification){
        tableView.reloadData()
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        self.tableView.rowHeight = 70
    let chevron = UIImage(named: "Fast Forward-30.png")
        // Configure the cell...
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("supplier_cell", forIndexPath: indexPath)
        cell.textLabel!.text = suppliers.suppliersData[indexPath.row].supName
        cell.detailTextLabel!.text = "Location: \(suppliers.suppliersData[indexPath.row].supLocation)"
        cell.textLabel!.font = UIFont.systemFontOfSize(24)
        cell.detailTextLabel!.font = UIFont.systemFontOfSize(22, weight: UIFontWeightLight)
        cell.accessoryType = .DisclosureIndicator
        cell.accessoryView = UIImageView(image: chevron)
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dest = segue.destinationViewController as! PreOrderProductsViewController
        let row = tableView.indexPathForSelectedRow?.row
        dest.selectedSupplier = suppliers.suppliersData[row!].supName
        
//        let dest2 = segue.destinationViewController as! Products
//        dest2.selectedSuppliers = suppliers.suppliersData[row!].supName
        
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
