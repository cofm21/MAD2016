//
//  ViewController.swift
//  Countries
//
//  Created by Connor McGuinness on 1/28/16.
//  Copyright © 2016 Connor McGuinness. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var continentList = Continents()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("continents", ofType: "plist")
        
        continentList.continentData = NSDictionary(contentsOfFile: path!) as! [String : [String]]
        continentList.continents = Array(continentList.continentData.keys)
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return continentList.continentData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
        cell.textLabel?.text = continentList.continents[indexPath.row]
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

