//
//  DetailViewController.swift
//  groceryList
//
//  Created by Connor McGuinness on 3/10/16.
//  Copyright © 2016 Connor McGuinness. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    
    
    var stores = [String]()
    var selectedStore = 0
    
    var storeListDetail = Stores()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    @IBAction func unwindSegue(segue:UIStoryboardSegue){
        if segue.identifier=="doneSegue"{
        let source = segue.sourceViewController as! AddItemViewController
        //only add a country if there is text in the textfield
        if ((source.addedItem.isEmpty) == false){
        stores.append(source.addedItem)
        tableView.reloadData()
        let chosenStore = storeListDetail.store[selectedStore]
        storeListDetail.storeData[chosenStore]?.append(source.addedItem)
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        storeListDetail.store = Array(storeListDetail.storeData.keys)
        let chosenStore = storeListDetail.store[selectedStore]
        stores = storeListDetail.storeData[chosenStore]! as [String]
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

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stores.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        cell.textLabel?.text=stores[indexPath.row]

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
            // Delete the row from the data source
            let chosenStore = storeListDetail.store[selectedStore]
            storeListDetail.storeData[chosenStore]?.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
   
    }
    

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
