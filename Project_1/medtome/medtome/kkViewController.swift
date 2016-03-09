//
//  kkViewController.swift
//  medtome
//
//  Created by Connor McGuinness on 3/8/16.
//  Copyright © 2016 Connor McGuinness. All rights reserved.
//

import Foundation
import UIKit

class kkViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var labelMsg: UILabel!
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var strain: UITextField!
    @IBOutlet weak var type: UITextField!
    
    
    func loadWebPage(urlString: String){
        
        //create NSURL object
        let url = NSURL(string: urlString)
        
        //create NSURLRequest object
        let request = NSURLRequest(URL: url!)
        
        //load the NSURLRequest object in our web view
        webView.loadRequest(request)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadWebPage("https://weedmaps.com/dispensaries/karing-kind")
    }
    
    @IBAction func submitOrder(sender: UIButton) {
        labelMsg.text = "Your order has been submitted to our database! A driver will review it and will deliver before the end of today!"
    }
    
}