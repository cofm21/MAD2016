//
//  AddCountryViewController.swift
//  countries_add
//
//  Created by Connor McGuinness on 2/16/16.
//  Copyright © 2016 Connor McGuinness. All rights reserved.
//

import UIKit

class AddCountryViewController: UIViewController {

    @IBOutlet weak var countryTextfield: UITextField!
    var addedCountry = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneSegue"{
            if ((countryTextfield.text?.isEmpty) == false){
                addedCountry=countryTextfield.text!
            }
        }
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
