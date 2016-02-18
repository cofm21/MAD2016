//
//  DetailViewController.swift
//  Picture_Collection
//
//  Created by Connor McGuinness on 2/18/16.
//  Copyright © 2016 Connor McGuinness. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var imageName : String?

    @IBOutlet weak var detailviewImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = imageName {
            detailviewImage.image = UIImage(named: name)
        }

        // Do any additional setup after loading the view.
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
