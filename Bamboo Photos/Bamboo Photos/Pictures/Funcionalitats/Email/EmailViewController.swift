//
//  EmailViewController.swift
//  Bamboo Photos
//
//  Created by Enric Broto Hernandez on 22/2/21.
//

import UIKit
import MessageUI

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
        enviarMail()
    }
    
    @IBAction func botonGuardar(_ sender: Any) {
        let popUpuserName = nameTextfield.text!
        let popUpuserEmail = emailTextfield.text!
        
        if popUpuserName.isEmpty || popUpuserEmail.isEmpty {
            let alert = UIAlertController(title: "Ja has escrit el teu nom i e-mail?", message: "Falten dades", preferredStyle: .actionSheet)

                        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
                        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
                        self.present(alert, animated: true)
        } else {
        
        saveToUserDefaults()
        updateTextview()
        }
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
    
// per enviar un mail al correu que introduim als textfiels
    func enviarMail() {
        let userName: String = nameTextfield.text!
        let userEmail = emailTextfield.text!
        
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([userEmail])
            mail.setMessageBody("Hola \(userName), \n lwugfuwhfiwenhcbfqwueh", isHTML: false)
            
            present(mail, animated: true)
        }
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

extension EmailViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
