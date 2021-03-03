//
//  BmiCalcViewController.swift
//  Devoir1
//
//  Created by Mac11 on 2021-03-03.
//

import UIKit

class BmiCalcViewController: UIViewController {
    
    private var weight: Float = 60
    private var height: Int = 180
    
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var bmiLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        updateWeight()
        updateHeight()
    }

    private func updateWeight() {
        weightSlider.value = weight
        weightField.text = String(weight)
    }
    private func updateHeight() {
        heightSlider.value = Float(height)
        heightField.text = String(height)
    }
    
    @IBAction func WeightSlider(_ sender: UISlider) {
        let a = String(format: "%.2f", sender.value)
        weight = (a as NSString).floatValue
        updateWeight()
    }
    
    @IBAction func HeightSlider(_ sender: UISlider) {
        height = Int(sender.value)
        updateHeight()
    }
    
    @IBAction func WeightField(_ sender: UITextField) {
        let str = sender.text
        weight = (str! as NSString).floatValue
        updateWeight()
    }
    
    @IBAction func HeightField(_ sender: UITextField) {
        height = Int(sender.text!)!
        updateHeight()
    }
    
    @IBAction func CheckBMI(_ sender: Any) {
        
        bmiLbl.text = "Your BMI is " + String(format: "%.1f", Double(weight) / pow(Double(height)/100, 2))
        
        bmiLbl.isHidden = false
    }
}
