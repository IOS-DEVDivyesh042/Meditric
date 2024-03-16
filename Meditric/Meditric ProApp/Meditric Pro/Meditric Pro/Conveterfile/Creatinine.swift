//
//  Creatinine.swift
//  screen
//
//  Created by Manish Bhanushali on 22/10/23.
//

import UIKit

class Creatinine: UIViewController {
    @IBOutlet weak var inputTextField: UITextField!
        @IBOutlet weak var outputLabel: UILabel!
        @IBOutlet weak var unitPicker: UIPickerView!
        @IBOutlet weak var convertButton: UIButton!
        
        let units = ["mg/dL", "µmol/L", "mmol/L"]
        
        // Conversion factors
        let mgPerDLToMicroMolPerL = 88.42
        let mgPerDLToMmolPerL = 0.08842

        override func viewDidLoad() {
            super.viewDidLoad()
            unitPicker.dataSource = self
            unitPicker.delegate = self
            navigationItem.title = "Creatinine"
            convertButton.layer.cornerRadius = 20
        }

        @IBAction func convertButtonPressed(_ sender: UIButton) {
            if let inputValue = Double(inputTextField.text ?? "") {
                let selectedUnit = unitPicker.selectedRow(inComponent: 0)
                var convertedValue: Double = 0.0

                switch selectedUnit {
                case 1: // µmol/L
                    convertedValue = inputValue * mgPerDLToMicroMolPerL
                case 2: // mmol/L
                    convertedValue = inputValue * mgPerDLToMmolPerL
                default: // mg/dL (0)
                    convertedValue = inputValue
                }

                outputLabel.text = "\(convertedValue)"
            }
        }
    }

    extension Creatinine: UIPickerViewDataSource, UIPickerViewDelegate {
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
