//
//  EmailViewController.swift
//  Bamboo Photos
//
//  Created by Enric Broto Hernandez on 22/2/21.
//

import UIKit

class EmailViewController: UIViewController {

   
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var textView: UITextView!
    
  
    let messageTextview = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTextview()
    }
    
    
    @IBAction func botonEnviar(_ sender: Any) {
    }
    
    @IBAction func botonGuardar(_ sender: Any) {
        saveToUserDefaults()
        updateTextview()
    }
    
    func readName() {
        
    }


// guardem la info al disc dur
    func saveToUserDefaults() {
        let userName: String = nameTextfield.text!
        let userEmail = emailTextfield.text!
        UserDefaults.standard.setValue(userName, forKey: "name")
        UserDefaults.standard.setValue(userEmail, forKey: "email")
        UserDefaults.standard.synchronize()
    }
  
    
// recuperem la info del disc dur
    func updateTextview() {
        let userName = UserDefaults.standard.string(forKey: "name") ?? "Sense nom"
        let userEmail = UserDefaults.standard.string(forKey: "email") ?? "Sense email"
        print("\(userName); \(userEmail)")
        textView.text  += "\n \(userName): \(userEmail)"
//        return "\(userName); \(userEmail)"
     
    }
    
  
}

extension EmailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        print("has clicat return")
        if textField == nameTextfield {
//            print("has introduit \(nameTextfield.text)")
            emailTextfield.becomeFirstResponder()
        } else if  textField == emailTextfield{
//            print("has introdiut el \(emailTextfield.text)")
            emailTextfield.resignFirstResponder()
        } else {
            print("no se que has clicat")
        }
        
        return true
    }
}
