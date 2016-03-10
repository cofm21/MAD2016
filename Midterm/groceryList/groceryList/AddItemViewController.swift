//
//  AddItemViewController.swift
//  groceryList
//
//  Created by Connor McGuinness on 3/10/16.
//  Copyright © 2016 Connor McGuinness. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var addItem: UITextField!
    
    var addedItem = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneSegue"{
        //only add a country if there is text in the textfield
        if ((addItem.text?.isEmpty) == false){
            addedItem=addItem.text!
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
