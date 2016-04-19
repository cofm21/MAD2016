//
//  MasterViewController.swift
//  petitions
//
//  Created by Connor McGuinness on 3/15/16.
//  Copyright © 2016 Connor McGuinness. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [[String: String]]()


    override func viewDidLoad() {
        super.viewDidLoad()
        loadjson()
        
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadjson() {
        let urlPath = "https://api.whitehouse.gov/v1/petitions.json?limit=50"
        guard let url = NSURL(string: urlPath)
            else {
                print("url error")
                return
        }
        let session = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: {(data, response, error) in
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            guard statusCode == 200
                else {
                    print("file download error")
                    return
            }e
            dispatch_async(dispatch_get_main_queue()) {self.parsejson(data!)}
        })
        session.resume()
    }
    
    func parsejson(data: NSData) {
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary

            let meta = json["metadata"] as! NSDictionary
            let response = meta.objectForKey("responseInfo") as! NSDictionary
            let status = response.objectForKey("status") as! Int
            if status == 200 {
                let allresults = json["results"] as! NSArray
                let results = Array(allresults)
                
                for result in results {
                    guard let title = result["title"]! as? String,
                    let sigCount = result["signatureCount"] as? NSNumber,
                    let itemurl = result["url"]! as? String
                    else {
                        continue
                    }
                    let obj = ["title": title, "signature": sigCount.stringValue, "url": itemurl]
                    self.objects.append(obj)
                }
            }
        }
        catch {
            print("Error with JSON: \(error)")
        }
        tableView.reloadData()
        
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let petition = objects[indexPath.row]
                let title = petition["title"]
                let url = petition["url"]
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = url
                controller.title = title
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let object = objects[indexPath.row]
        cell.textLabel!.text = object["title"]
        if object["signature"] != nil {
            cell.detailTextLabel!.text = object["signature"]! + " signatures"
        }
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor(red: 0.80, green: 0.90, blue: 0.0, alpha: 0.0)
        }
        else
        {
            cell.backgroundColor = UIColor(red: 0.00, green: 0.00, blue: 0.9, alpha: 0.03)
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {

    }

}

