//
//  SecondViewController.swift
//  Music
//
//  Created by Connor McGuinness on 1/27/16.
//  Copyright © 2016 Connor McGuinness. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var choiceLabel: UILabel!
    @IBOutlet weak var musicPicker: UIPickerView!
    
    let genre = ["Country", "Pop", "Rock", "Classical", "Alternative", "Hip Hop", "Jazz"]
    let decade = ["1950s", "1960s", "1970s", "1980s", "1990s", "2000s", "2010s"]
    
    //Implement the picker
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return genre.count
        } else {
            return decade.count
        }
    }
    
    //returns title for the row
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return genre[row]
        } else {
            return decade[row]
        }
        
    }
    
    //Called when a row is selected
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let genrerow = pickerView.selectedRowInComponent(0)
        let decaderow = pickerView.selectedRowInComponent(1)
        choiceLabel.text="You like \(genre[genrerow]) from the \(decade[decaderow])"
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

