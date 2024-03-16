//
//  Copper.swift
//  screen
//
//  Created by Manish Bhanushali on 22/10/23.
//

import UIKit

class Copper: UIViewController {
    @IBOutlet weak var inputTextField: UITextField!
       @IBOutlet weak var outputLabel: UILabel!
       @IBOutlet weak var unitPicker: UIPickerView!
       @IBOutlet weak var convertButton: UIButton!
       
       let units = ["mg/dL", "µg/L", "ng/mL"]
       

       let mgPerDLToMicrogPerL = 1000.0
       let mgPerDLToNgPerML = 1000000.0

       override func viewDidLoad() {
           super.viewDidLoad()
           unitPicker.dataSource = self
           unitPicker.delegate = self
           navigationItem.title = "Copper"
           convertButton.layer.cornerRadius = 20
       }

       @IBAction func convertButtonPressed(_ sender: UIButton) {
           if let inputValue = Double(inputTextField.text ?? "") {
               let selectedUnit = unitPicker.selectedRow(inComponent: 0)
               var convertedValue: Double = 0.0

               switch selectedUnit {
               case 1:
                   convertedValue = inputValue * mgPerDLToMicrogPerL
               case 2: 
                   convertedValue = inputValue * mgPerDLToNgPerML
               default:
                   convertedValue = inputValue
               }

               outputLabel.text = "\(convertedValue)"
           }
       }
   }

   extension Copper: UIPickerViewDataSource, UIPickerViewDelegate {
       func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }

       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           return units.count
       }

       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           return units[row]
       }
   }

   
