//
//  ViewController.swift
//  Meditric Pro
//
//  Created by Manish Bhanushali on 22/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var view2: UIView!
    
    
    @IBOutlet weak var BTN1: UIButton!
    
    
    @IBOutlet weak var BTN2: UIButton!
    
    
    @IBOutlet weak var BTN3: UIButton!
    
    
    @IBOutlet weak var BTN4: UIButton!
    
    @IBOutlet weak var BTN5: UIButton!
    
    @IBOutlet weak var BTN6: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view1.layer.cornerRadius = 20
        view2.layer.cornerRadius = 20
        
        
        BTN1.layer.cornerRadius = 20
        BTN2.layer.cornerRadius = 20
        BTN3.layer.cornerRadius = 20
        BTN4.layer.cornerRadius = 20
        BTN5.layer.cornerRadius = 20
        BTN6.layer.cornerRadius = 20
         
        // Do any additional setup after loading the view.
    }

    @IBAction func btn1(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Copper") as!
        Copper
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn2(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Calcium") as!
        Calcium
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func btn3(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Cortisol") as!
        Cortisol
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func btn4(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Calcitonin") as!
        Calcitonin
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func btn5(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Creatinine") as! Creatinine
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func btn6(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Carbamazepine") as!
        Carbamazepine
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}

