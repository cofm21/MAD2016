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

        var newRef = usersRef.childByAppendingPath(name)
        
        var userData = ["email": email.text!, "password": password.text!]
        
        
        newRef.observeEventType(.Value, withBlock: { snapshot in
            var currEmail = snapshot.value.objectForKey("email")
            print(currEmail)
            }, withCancelBlock: { error in
                print(error.description)
        })
        
        usersRef.childByAppendingPath(name).setValue(userData)
        
        statusLabel.text = "Thank you \(name)! Tap continue to start ordering."
        
    }

    @IBAction func submitButton(sender: UIButton) {
        sendData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

