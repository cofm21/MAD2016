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
        
        let path = NSBundle.mainBundle().pathForResource("qwordswithoutu2", ofType: "plist")
        allwords = NSDictionary(contentsOfFile: path!) as! [String : [String]]
        letters = Array(allwords.keys)
        letters.sortInPlace({$0 < $1})
        
        // search results
        let resultsController = SearchResultsController()
        resultsController.allwords = allwords
        resultsController.letters = letters
        searchController = UISearchController(searchResultsController: resultsController)
        
        // search options
        searchController.searchBar.placeholder = "Enter a search term"
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView=searchController.searchBar
        searchController.searchResultsUpdater = resultsController
    }
    
    // number of rows in the section
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let letter = letters[section]
        let letterSection = allwords[letter]! as [String]
        return letterSection.count
    }
    
    // displays table view cells
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section = indexPath.section
        let letter = letters[section]
        let wordsSection = allwords[letter]! as [String]
        // cell configurations
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
        cell.textLabel?.text = wordsSection[indexPath.row]
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

