//
//  ViewController.swift
//  countries_add
//
//  Created by Connor McGuinness on 2/16/16.
//  Copyright © 2016 Connor McGuinness. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var continentList=Continents()
    let kfilename = "data.plist"

    override func viewDidLoad() {
        super.viewDidLoad()
        let path:String?
        let filePath = docFilePath(kfilename)
        if NSFileManager.defaultManager().fileExistsAtPath(filePath!){
            path = filePath
            print(path)
        }
        else {
            path = NSBundle.mainBundle().pathForResource("continents", ofType: "plist")
            print(path)
        }
        
        continentList.continentData = NSDictionary(contentsOfFile: path!) as! [String : [String]]

        continentList.continents = Array(continentList.continentData.keys)

        let app = UIApplication.sharedApplication()

        NSNotificationCenter.defaultCenter().addObserver(self, selector:"applicationWillResignActive:", name:"UIApplicationWillResignActiveNotification", object: app)
    }
    

    func applicationWillResignActive(notification: NSNotification){
        let filePath = docFilePath(kfilename)
        let data = NSMutableDictionary()

        data.addEntriesFromDictionary(continentList.continentData)
        print(data)

        data.writeToFile(filePath!, atomically: true)
    }
    
    func docFilePath(filename: String) -> String?{
        let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
        let dir = path[0] as NSString
        return dir.stringByAppendingPathComponent(filename)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "countrysegue" {
            let detailVC = segue.destinationViewController as! DetailViewController
            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
            
            detailVC.title = continentList.continents[indexPath.row]
            detailVC.continentListDetail=continentList
            detailVC.selectedContinent = indexPath.row
        } else if segue.identifier == "continentsegue"{
            let infoVC = segue.destinationViewController as! ContinentInfoViewController
            let editingCell = sender as! UITableViewCell
            let indexPath = tableView.indexPathForCell(editingCell)
            infoVC.name = continentList.continents[indexPath!.row]
            let countries = continentList.continentData[infoVC.name]! as [String]
            infoVC.number = String(countries.count)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return continentList.continentData.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
            cell.textLabel?.text = continentList.continents[indexPath.row]
            return cell
    }


}

