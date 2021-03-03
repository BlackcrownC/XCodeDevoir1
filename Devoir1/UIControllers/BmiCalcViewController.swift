//
//  BmiCalcViewController.swift
//  Devoir1
//
//  Created by Mac11 on 2021-03-03.
//

import UIKit

class BmiCalcViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var weight: Float = 60
    private var height: Int = 180
    
    private var bmiTitlesData = ["Severly underweight", "Underweight", "Normal", "OverWeight", "Obese class I", "Obese class II", "Obese class III"]
    private var bmiNbData = ["< 16", "16 - 18.5", "18.5 - 25", "25 - 30", "30 - 35", "35 - 40", "> 40"]
    
    @IBOutlet weak var bmiTable: UITableView!
    
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
        
        bmiTable.dataSource = self
        bmiTable.delegate = self
    }
    
    // Sliders and TextFields Weight and Height manipulation

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
    
    private var lastI = 0
    
    @IBAction func CheckBMI(_ sender: Any) {
        bmiTable.cellForRow(at: IndexPath(row: lastI, section: 0))?.textLabel!.backgroundColor = UIColor.clear
        
        let bmi = Double(weight) / pow(Double(height)/100, 2)
        let i: Int
        
        bmiLbl.text = "Your BMI is " + String(format: "%.1f", bmi)
        
        bmiLbl.isHidden = false
        
        bmiTable.isHidden = false
        
        switch bmi {
        case _ where bmi < 16:
            i = 0
        case 16..<18.5:
            i = 1
        case 18.5..<25:
            i = 2
        case 25..<30:
            i = 3
        case 30..<35:
            i = 4
        case 35..<40:
            i = 5
        case _ where bmi > 40:
            i = 6
        default:
            i = 0
        }
        
        bmiTable.cellForRow(at: IndexPath(row: i, section: 0))?.textLabel!.backgroundColor = UIColor.yellow
        lastI = i
    }
    
    // TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bmiTitlesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bmiCell", for: indexPath)
        
        cell.textLabel?.text = bmiTitlesData[indexPath.row]
        cell.detailTextLabel?.text = bmiNbData[indexPath.row]
        
        return cell
    }
}
