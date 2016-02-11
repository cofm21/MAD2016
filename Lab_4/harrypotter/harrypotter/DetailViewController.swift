//
//  DetailViewController.swift
//  harrypotter
//
//  Created by Connor McGuinness on 2/11/16.
//  Copyright © 2016 Connor McGuinness. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var webSpinner: UIActivityIndicatorView!
    
    
    // reference to selection from master view
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    // updates label with the detail item
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
                loadWebPage(detail.description)
            }
        }
    }
    
    func loadWebPage(urlString: String){
        
        //create NSURL object
        let url = NSURL(string: urlString)
        
        //create NSURLRequest object
        let request = NSURLRequest(URL: url!)
        
        //load the NSURLRequest object in our web view
        webView.loadRequest(request)
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        webSpinner.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        webSpinner.stopAnimating()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

