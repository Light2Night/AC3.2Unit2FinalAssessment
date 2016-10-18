//
//  SecondViewController.swift
//  AC3.2Unit2FinalAssessment
//
//  Created by Kadell on 10/6/16.
//  Copyright © 2016 Kadell. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var textOutput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderMoves(_ sender: UISlider) {
//        var change = slider.value
//        textOutput.text = String(Double(change))
//        stepper.value = Double(sender.value)
         stepper.value = Double(slider.value)
        textOutput.text = "\(slider.value)"
        
    }

    @IBAction func stepperMoves(_ sender: UIStepper) {
//        var change = stepper.value
//        textOutput.text = String(Double(change))
        slider.value = Float(stepper.value)
        textOutput.text = "\(stepper.value)"
        
        
    }
   //MARK
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let textFieldText = textField.text, let doubleText = Double(textFieldText), let floatText = Float(textFieldText) {
            slider.value = floatText
            stepper.value = doubleText
            textOutput.text = textFieldText
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let textFieldText = textField.text, let doubleText = Double(textFieldText), let floatText = Float(textFieldText) {
            slider.value = floatText
            stepper.value = doubleText
            textOutput.text = textFieldText
        }
        
        return true
    }
    
  
}
}
