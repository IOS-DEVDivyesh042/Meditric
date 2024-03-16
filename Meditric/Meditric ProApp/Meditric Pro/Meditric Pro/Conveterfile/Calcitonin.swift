//
//  Calcitonin.swift
//  screen
//
//  Created by Manish Bhanushali on 22/10/23.
//

import UIKit

class Calcitonin: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
        @IBOutlet weak var outputLabel: UILabel!
        @IBOutlet weak var unitPicker: UIPickerView!
        @IBOutlet weak var convertButton: UIButton!
        
        let units = ["pg/mL", "ng/L", "µg/L"]
        
        // Conversion factors
        let pgPerMlToNgPerL = 0.001
        let pgPerMlToMicrogPerL = 0.000001

        override func viewDidLoad() {
            super.viewDidLoad()
            unitPicker.dataSource = self
            unitPicker.delegate = self
            navigationItem.title = "Calcitonin"
            convertButton.layer.cornerRadius = 20
        }

        @IBAction func convertButtonPressed(_ sender: UIButton) {
            if let inputValue = Double(inputTextField.text ?? "") {
                let selectedUnit = unitPicker.selectedRow(inComponent: 0)
                var convertedValue: Double = 0.0

                switch selectedUnit {
                case 1: // ng/L
                    convertedValue = inputValue / pgPerMlToNgPerL
                case 2: // µg/L
                    convertedValue = inputValue / pgPerMlToMicrogPerL
                default: // pg/mL (0)
                    convertedValue = inputValue
                }

                outputLabel.text = "\(convertedValue)"
            }
        }
    }

    extension Calcitonin : UIPickerViewDataSource, UIPickerViewDelegate {
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
