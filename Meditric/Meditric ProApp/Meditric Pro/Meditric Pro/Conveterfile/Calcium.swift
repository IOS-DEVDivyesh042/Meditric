//
//  Calcium.swift
//  screen
//
//  Created by Manish Bhanushali on 22/10/23.
//

import UIKit

class Calcium: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
       @IBOutlet weak var outputLabel: UILabel!
       @IBOutlet weak var unitPicker: UIPickerView!
       @IBOutlet weak var convertButton: UIButton!
       
       let units = ["mg/dL", "mmol/L"]
       
       // Conversion factors
       let mgPerDLToMmolPerL = 0.0259

       override func viewDidLoad() {
           super.viewDidLoad()
           unitPicker.dataSource = self
           unitPicker.delegate = self
           navigationItem.title = "Calcuim"
           convertButton.layer.cornerRadius = 20
       }

       @IBAction func convertButtonPressed(_ sender: UIButton) {
           if let inputValue = Double(inputTextField.text ?? "") {
               let selectedUnit = unitPicker.selectedRow(inComponent: 0)
               var convertedValue: Double = 0.0

               switch selectedUnit {
               case 1: // mmol/L
                   convertedValue = inputValue / mgPerDLToMmolPerL
               default: // mg/dL (0)
                   convertedValue = inputValue
               }

               outputLabel.text = "\(convertedValue)"
           }
       }
   }

   extension Calcium: UIPickerViewDataSource, UIPickerViewDelegate {
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
