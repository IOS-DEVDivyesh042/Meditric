//
//  SidemenuVCc.swift
//  AreaConverter
//
//  Created by mac pro on 01/03/23.
//

import UIKit

class SidemenuVCc: UIViewController {

    @IBOutlet weak var txtFeedback: UITextView!
    @IBOutlet weak var btnshare : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnshare.layer.cornerRadius = 20
        btnshare.layer.borderColor = UIColor.black.cgColor
        btnshare.layer.borderWidth = 1
        
        txtFeedback.layer.borderColor =  UIColor.black.cgColor
        txtFeedback.layer.borderWidth = 2
            

    }
    
    @IBAction func btnShare(_ sender: UIButton) {
        if(txtFeedback.text!.count == 0) {
            let alert = UIAlertController(title: "Alert", message: "Please Enter Your FeedBack", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default , handler: { (_) in
                
            }))
            self.present(alert, animated: true)
        }
        
        txtFeedback.text = ""
        let alert = UIAlertController(title: "Thanks", message: "Your Feedback Send Successfully!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
