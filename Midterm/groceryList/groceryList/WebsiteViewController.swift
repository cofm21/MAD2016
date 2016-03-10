//
//  WebsiteViewController.swift
//  groceryList
//
//  Created by Connor McGuinness on 3/10/16.
//  Copyright © 2016 Connor McGuinness. All rights reserved.
//

import UIKit

class WebsiteViewController: UIViewController {

    @IBOutlet weak var webSpinner: UIActivityIndicatorView!
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebPage("https://google.com")
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        webSpinner.hidden = false
        webSpinner.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        webSpinner.hidden = true
        webSpinner.stopAnimating()
        
        
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
