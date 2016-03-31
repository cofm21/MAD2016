//
//  WebViewController.swift
//  recipes
//
//  Created by Connor McGuinness on 3/30/16.
//  Copyright © 2016 Connor McGuinness. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var webSpinner: UIActivityIndicatorView!
    
    var webpage : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
        loadWebPage()

        // Do any additional setup after loading the view.
    }
    
    func loadWebPage() {
        
        //the url string needs to be a proper url
        guard let weburl = webpage
            else {
                print("no web page found")
                return
        }

        let url = NSURL(string: weburl)
        print("web page found")

        let request = NSURLRequest(URL: url!)

        webView.loadRequest(request)
    
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        webSpinner.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        webSpinner.stopAnimating()
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
