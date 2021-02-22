//
//  EmailViewController.swift
//  Bamboo Photos
//
//  Created by Enric Broto Hernandez on 22/2/21.
//

import UIKit

class EmailViewController: UIViewController {

    @IBOutlet weak var NameTextfield: UITextField!


    
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func testSave() {
        let userName: String = NameTextfield.text!
        UserDefaults.standard.setValue(userName, forKey: "name")
        UserDefaults.standard.synchronize()
    }
    
    
}

extension EmailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("has clicat return")
        if textField == NameTextfield {
            print("has introduit \(NameTextfield.text)")
            emailTextfield.becomeFirstResponder()
        } else if  textField == emailTextfield{
            print("has introdiut el \(emailTextfield.text)")
            emailTextfield.resignFirstResponder()
        } else {
            print("no se que has clicat")
        }
        
        return true
    }
}
