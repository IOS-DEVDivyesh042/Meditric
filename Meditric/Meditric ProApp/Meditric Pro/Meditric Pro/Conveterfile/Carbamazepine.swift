//
//  Carbamazepine.swift
//  screen
//
//  Created by Manish Bhanushali on 22/10/23.
//

import UIKit

class Carbamazepine: UIViewController {
    @IBOutlet weak var inputTextField: UITextField!
        @IBOutlet weak var outputLabel: UILabel!
        @IBOutlet weak var unitPicker: UIPickerView!
        @IBOutlet weak var convertButton: UIButton!
        
        let units = ["mg/L", "µg/mL", "ng/mL"]
        
        // Conversion factors
        let mgPerLToMicrogPerML = 1000.0
        let mgPerLToNgPerML = 1000000.0

        override func viewDidLoad() {
            super.viewDidLoad()
            unitPicker.dataSource = self
            unitPicker.delegate = self
            navigationItem.title = "Carbamazepine"
            convertButton.layer.cornerRadius = 20
        }

        @IBAction func convertButtonPressed(_ sender: UIButton) {
            if let inputValue = Double(inputTextField.text ?? "") {
                let selectedUnit = unitPicker.selectedRow(inComponent: 0)
                var convertedValue: Double = 0.0

                switch selectedUnit {
                case 1:
                    convertedValue = inputValue * mgPerLToMicrogPerML
                case 2:
                    convertedValue = inputValue * mgPerLToNgPerML
                default: 
                    convertedValue = inputValue
                }

                outputLabel.text = "\(convertedValue)"
            }
        }
    }

    extension Carbamazepine: UIPickerViewDataSource, UIPickerViewDelegate {
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
