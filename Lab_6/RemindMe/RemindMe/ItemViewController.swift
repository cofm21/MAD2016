//
//  ItemViewController.swift
//  RemindMe
//
//  Created by Connor McGuinness on 2/23/16.
//  Copyright © 2016 Connor McGuinness. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var itemtextField: UITextField!
    @IBOutlet weak var reminderDatePicker: UIDatePicker!
    
    var addedItem : ToDoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemtextField.delegate = self
        

        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "save" {
            if ((itemtextField.text?.isEmpty) == false) {
                // initialize added item
                addedItem = ToDoItem(newName: itemtextField.text!, newReminderDate: reminderDatePicker.date, newId: NSUUID().UUIDString)
                
            }
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
