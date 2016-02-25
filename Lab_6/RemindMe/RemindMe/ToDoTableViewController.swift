//
//  ToDoTableViewController.swift
//  RemindMe
//
//  Created by Connor McGuinness on 2/23/16.
//  Copyright © 2016 Connor McGuinness. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var items = [ToDoItem]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refreshList", name: "ListShouldRefresh", object: nil)
    }
    
    func refreshList() {
        tableView.reloadData()
        self.setBadgeNumber()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        if segue.identifier == "save" {
            let source = segue.sourceViewController as! ItemViewController
            if let newItem = source.addedItem {
                items.append(newItem)
                tableView.reloadData()
                addNotification(newItem)
            }
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = items[indexPath.row].name
        if items[indexPath.row].overDue() {
            cell.detailTextLabel?.textColor = UIColor.redColor()
        } else {
            
            cell.detailTextLabel?.textColor = UIColor.blackColor()
        }
        let dateformatter = NSDateFormatter()
        dateformatter.dateFormat="EEE MMM dd yyyy hh:mm:ss a w"
        let date = items[indexPath.row].reminderDate
        cell.detailTextLabel!.text = dateformatter.stringFromDate(date)

        return cell
    }
    
    func addNotification(item: ToDoItem) {
        let settings = UIApplication.sharedApplication().currentUserNotificationSettings()
        if settings?.types.rawValue == 0 {
            print("notifications not enabled")
        } else {
            let notification = UILocalNotification()
            notification.fireDate = item.reminderDate
            notification.alertBody = item.name
            notification.alertAction = "open"
            notification.soundName = UILocalNotificationDefaultSoundName
            notification.userInfo = ["title": item.name, "UUID": item.id]
            UIApplication.sharedApplication().scheduleLocalNotification(notification)
            self.setBadgeNumber()
        }
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            removeNotification(items[indexPath.row])
            items.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            self.setBadgeNumber()
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    func removeNotification(item: ToDoItem) {
        for notification in UIApplication.sharedApplication().scheduledLocalNotifications! as [UILocalNotification] {
            if notification.userInfo!["UUID"] as! String == item.id {
                UIApplication.sharedApplication().cancelLocalNotification(notification)
                
            }
        }
    }
    
    func setBadgeNumber() {
        var badgeNumber = 0
        for item in items{
            if item.overDue() {
                badgeNumber++
            }
        }
        UIApplication.sharedApplication().applicationIconBadgeNumber = badgeNumber
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
