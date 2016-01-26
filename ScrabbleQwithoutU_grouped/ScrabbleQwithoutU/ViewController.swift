//
//  ViewController.swift
//  ScrabbleQwithoutU
//
//  Created by Connor McGuinness on 1/26/16.
//  Copyright © 2016 Connor McGuinness. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var allwords : [String :[String]]!
    var letters : [String]!
    var searchController : UISearchController!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //use NSBundle object of the directory for app to retrieve the pathname of qwords1.plist
        let path = NSBundle.mainBundle().pathForResource("qwords2", ofType: "plist")
        
        //load the words in plist file into the array
        allwords = NSDictionary(contentsOfFile: path!) as! [String : [String]]
        
        letters = Array(allwords.keys)
        
        letters.sortInPlace({$0 < $1}) //example of closure
    }
    
    //required methods for UITableViewDataSource
    //number of rows in the section
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let letter = letters[section]
        let letterSection = allwords[letter]! as [String]
        return letterSection
    }
    
    //Display table view cells
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section = indexPath.section
        let letter = letters[section]
        let wordsSection = allwords[letter]! as [String]
        
        //dequeue an existing cell if one is available, or create a new one and add it to the table
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
        cell.textLabel?.text = words[indexPath.row]
        cell.imageView?.image = UIImage(named: "scrabble_q.png")
        cell.detailTextLabel?.text = "Q no U"
        return cell
    }
    
    //UITableViewDelegate method that is called when a row is selected
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let section = indexPath.section
        let letter = letters[section]
        let wordsSection = allwords[letter]! as [String]
        let alert = UIAlertController(title: "Row selected", message: "You selected \(wordsSection[indexPath.row])", preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(okAction)
        presentViewController(alert, animated: true, completion: nil)
        //tableView.deselectRowAtIndexPath(indexPath, animated: true) // deselects row that had been chosen
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return letters.count
    }
    
    //sets the header value for each section
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return letters[section]
    }
    
    //adds a section index
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return letters
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

