//
//  IdealWeightViewController.swift
//  Devoir1
//
//  Created by Mac11 on 2021-03-01.
//

import UIKit

class IdealWeightViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var HeightPicker: UIPickerView!
    @IBOutlet weak var BirthDatePicker: UIDatePicker!
    var heightData: [Int] = Array(1...250)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
         
        self.HeightPicker.delegate = self
        self.HeightPicker.dataSource = self
        
        self.HeightPicker.selectRow(180, inComponent: 0, animated: false)
    }
    
    // Picker View for Height
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return heightData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return String(row)
    }
    
    @IBAction func CalculateIdealWeight(_ sender: Any) {
        let age: Double = Double(Calendar.current.dateComponents([.year], from: BirthDatePicker.date, to: Date()).year!)
        let height: Double = Double(HeightPicker.selectedRow(inComponent: 0))
        
        let idealWeight: Double = (height - 100 + age/10 ) * 0.9
        
        let alertView = UIAlertController(title: "Ideal Weight", message: String(format: "%.2f", idealWeight) + " kg" , preferredStyle: .alert)
        
        alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alertView, animated: true, completion: nil)
    }
    
}
