//
//  ViewController.swift
//  medtome
//
//  Created by Connor McGuinness on 3/1/16.
//  Copyright © 2016 Connor McGuinness. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func continueButton(sender: UIButton) {
        performSegueWithIdentifier("map", sender: sender)
    }
    
    func sendData() {
        
        var name = username.text!
        var userEmail = email.text
        
        // Create a reference to a Firebase location
        var myRootRef = Firebase(url:"https://medtome.firebaseio.com")
        
        var usersRef = myRootRef.childByAppendingPath("users")
        
        var userData = ["email": email.text!, "password": password.text!]
        
        if username.text == "" {
            
            let alert = UIAlertController(title: "Error", message: "Please enter a username.", preferredStyle:UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else if email.text == "" {
            
            let alert = UIAlertController(title: "Error", message: "Please enter an email address.", preferredStyle:UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else if password.text == "" {
            
            let alert = UIAlertController(title: "Error", message: "Please enter a password.", preferredStyle:UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else {
        
            var newRef = usersRef.childByAppendingPath(name)
            
            usersRef.childByAppendingPath(name).setValue(userData)
            
            statusLabel.text = "Thank you \(name)! Tap continue to start ordering."
            newRef.observeEventType(.Value, withBlock: { snapshot in
                var currEmail = snapshot.value.objectForKey("email")
                print(currEmail)
                }, withCancelBlock: { error in
                    print(error.description)
            })
            
        }
        

        

        
    }

    @IBAction func submitButton(sender: UIButton) {
        sendData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

