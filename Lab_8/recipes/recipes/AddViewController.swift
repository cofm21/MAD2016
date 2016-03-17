//
//  AddViewController.swift
//  recipes
//
//  Created by Connor McGuinness on 3/17/16.
//  Copyright © 2016 Connor McGuinness. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var newName: UITextField!
    @IBOutlet weak var newURL: UITextField!
    
    var addedrecipe = String()
    var addedurl = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "savesegue" {
            if newName.text?.isEmpty == false {
                addedrecipe = newName.text!
                addedurl = newURL.text!
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
