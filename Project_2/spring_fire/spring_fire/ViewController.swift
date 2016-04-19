//
//  ViewController.swift
//  spring_fire
//
//  Created by Connor McGuinness on 4/18/16.
//  Copyright © 2016 Connor McGuinness. All rights reserved.
//  spring referenced from https://github.com/MengTo/Spring
//

import UIKit
import Spring


class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,  UITextFieldDelegate {
    
    @IBOutlet weak var imageChooser: UISegmentedControl!
    @IBOutlet weak var repeatCount: UITextField!
    @IBOutlet weak var effectPicker: UIPickerView!
    
    @IBOutlet weak var velocityAmount: UILabel!
    @IBOutlet weak var delayAmount: UILabel!
    
    @IBOutlet weak var delaySlider: UISlider!
    @IBOutlet weak var ballSpring: SpringImageView!
    
    var count : Float = 0
    var delayValue : CGFloat = 0
    var velocityValue : CGFloat = 1
    var effects = ["shake", "pop", "morph", "squeeze", "wobble", "swing", "flipX", "flipY", "fall", "squeezeLeft", "squeezeRight", "squeezeDown", "squeezeUp", "slideLeft", "slideRight", "slideDown", "slideUp", "fadeIn", "fadeOut", "fadeInLeft", "fadeInRight", "fadeInDown", "fadeInUp", "zoomIn", "zoomOut", "flash"]
    var animationType : String = "shake"
    
    @IBAction func velocitySilderChanged(sender: UISlider) {
        let changeVelocity = sender.value //float
        velocityAmount.text=String(format: "%.0f", changeVelocity) //convert float to String
        let velocityCGFloat = CGFloat(changeVelocity) //convert float to CGFloat
        
        velocityValue = velocityCGFloat
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        effectPicker.dataSource = self

        effectPicker.delegate = self
        self.repeatCount.delegate = self
        
        
    }
    
    @IBAction func imageChanged(sender: UISegmentedControl) {
        switch (imageChooser.selectedSegmentIndex)
        {
        case 0:
            ballSpring.image = UIImage(named: "ball")
        case 1:
            ballSpring.image = UIImage(named: "plane")
        case 2:
            ballSpring.image = UIImage.gifWithName("fire3")
        case 3:
            ballSpring.image = UIImage(named: "cup")
        default:
            break; 
        }
        
        
        
    }
    @IBAction func delayValueChanged(sender: UISlider) {
        let changeDelay = sender.value //float
        delayAmount.text=String(format: "%.0f", changeDelay) //convert float to String
        let delayCGFloat = CGFloat(changeDelay) //convert float to CGFloat
        
        delayValue = delayCGFloat
    }
    
    @IBAction func animateShape(sender: UIButton) {
        
        ballSpring.animation = animationType
        ballSpring.delay = delayValue
        ballSpring.force = velocityValue
        ballSpring.repeatCount = count
        
        ballSpring.animate()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return effects.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return effects[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch (effects[row]) {
        case("swing"):
            animationType = "swing"
        case("fall"):
            animationType = "fall"
        case("wobble"):
            animationType = "wobble"
        case("fadeIn"):
            animationType = "fadeIn"
        case("morph"):
            animationType = "morph"
        case("pop"):
            animationType = "pop"
        case("shake"):
            animationType = "shake"
        case("squeeze"):
            animationType = "squeeze"
        case("flipX"):
            animationType = "flipX"
        case("flipY"):
            animationType = "flipY"
        case("squeezeLeft"):
            animationType = "squeezeLeft"
        case("squeezeRight"):
            animationType = "squeezeRight"
        case("squeezeDown"):
            animationType = "squeezeDown"
        case("squeezeUp"):
            animationType = "squeezeUp"
        case("slideLeft"):
            animationType = "slideLeft"
        case("slideRight"):
            animationType = "slideRight"
        case("slideDown"):
            animationType = "slideDown"
        case("slideUp"):
            animationType = "slideUp"
        case("fadeIn"):
            animationType = "fadeIn"
        case("fadeOut"):
            animationType = "fadeOut"
        case("fadeInLeft"):
            animationType = "fadeInLeft"
        case("fadeInRight"):
            animationType = "fadeInRight"
        case("fadeInDown"):
            animationType = "fadeInDown"
        case("fadeInUp"):
            animationType = "fadeInUp"
        case("zoomIn"):
            animationType = "zoomIn"
        case("zoomOut"):
            animationType = "zoomOut"
        case("flash"):
            animationType = "flash"
        default:
            animationType = "swing"
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        count = (repeatCount.text! as NSString).floatValue
        textField.resignFirstResponder();
        return true;
    }



}

