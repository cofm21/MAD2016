//
//  ViewController.swift
//  groceryList
//
//  Created by Connor McGuinness on 3/10/16.
//  Copyright © 2016 Connor McGuinness. All rights reserved.
//

import UIKit

class storeViewController: UITableViewController {
    
    var storeList = Stores()
    
    let kfilename = "data.plist"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
        
        //let path = NSBundle.mainBundle().pathForResource("storeDict", ofType: "plist")
        
        //storeList.storeData = NSDictionary(contentsOfFile: path!) as! [String : [String]]
        //puts all the continents in an array
        //storeList.store = Array(storeList.storeData.keys)
        
        
        
        let path : String?
        let filePath = docFilePath(kfilename) //path to data file
        //if the data file exists, use it
        if NSFileManager.defaultManager().fileExistsAtPath(filePath!){
            path = filePath
        } else {
            //use a NSBundle object of the
            path = NSBundle.mainBundle().pathForResource("storeDict", ofType: "plist")
        }
    //load the data of the plist file into the dictionary
    storeList.storeData = NSDictionary(contentsOfFile: path!) as! [String : [String]]
    //puts all the continents in an array
    storeList.store = Array(storeList.storeData.keys)
    //application instance
    let app = UIApplication.sharedApplication()
    //subscribe to the UIApplicationWillResignActiveNotification notification
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationWillResignActive:", name: "UIApplicationWillResignActiveNotification", object: app)
    }
    
    func applicationWillResignActive(notification: NSNotification){
        let filePath = docFilePath(kfilename)
        let data = NSMutableDictionary()
        //adds our whole dictionary to the data dictionary
        data.addEntriesFromDictionary(storeList.storeData)
        //write the contents of the array to our plist file
        data.writeToFile(filePath!, atomically: true)
    }
    
    
    func docFilePath(filename: String) -> String?{
        //locate the documents directory
        let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true)
        let dir = path[0] as NSString //document directory
        //creates the full path to our data file
        return dir.stringByAppendingPathComponent(filename)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return storeList.storeData.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "storeSegue" {
            let detailVC = segue.destinationViewController as! DetailViewController
            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
        //sets the data for the destination controller
        detailVC.title = storeList.store[indexPath.row]
        detailVC.storeListDetail = storeList
        detailVC.selectedStore = indexPath.row
        }
    }
    
    @IBAction func unwindSegue(segue:UIStoryboardSegue){
                if segue.identifier=="storeInfoSegue"{
                }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
            cell.textLabel?.text = storeList.store[indexPath.row]
            
            return cell
    

    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

