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
    
    
    private let nameEmailKey: String = "MyNameAndEmailKey"
    private var listOfEmails: [String] = []
    
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
            alert.addAction(UIAlertAction(title: "No", style: .cancel , handler: nil))
            
                        self.present(alert, animated: true)
        } else {
        
        saveToUserDefaults()
        }
    }
    

    @IBAction func resetButton(_ sender: Any) {
        
           
     // creem el popUp
        let alert = UIAlertController(title: "Compte!", message: "Segur que vols esborrar les dades?", preferredStyle: .alert)
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: { action in print("has cancelat l'esborrat de dades")  //queda en negreta
            
        })
        alert.addAction(cancelAction)
        
//        alert.addAction(UIAlertAction(title: "default", style: .default, handler: nil))         //queda normal
        
        let removeAction = (UIAlertAction(title: "Eliminar", style: .destructive, handler: { action in print("Has esborrat les dades")
            
            self.resetData()
//            self.updateTextview()
            
        })) //queda en vermell
        alert.addAction(removeAction)

        // cridem el popUp
        self.present(alert, animated: true)
    }
    
// guardem la info al disc dur
    func saveToUserDefaults() {
//        let userName: String = nameTextfield.text!
//        let userEmail = emailTextfield.text!
//        UserDefaults.standard.setValue(userName, forKey: "name")
//        UserDefaults.standard.setValue(userEmail, forKey: "email")
//        UserDefaults.standard.synchronize()
        

// abans guardavem al disc un nom i un correu, ara ho modifiquem per guardar
       // trenquem l'opcional i generem la dada a guardar
        guard let name = nameTextfield.text,
              let email = emailTextfield.text else { return }
        
        let fullString: String = "\(name); \(email)"
    
        //llegeixo el que hi ha a la llista, podria ser que no hi ha dades, per tant em de trencar l'opcional
        var listOfnames: [String] = UserDefaults.standard.stringArray(forKey: nameEmailKey) ?? [String]()
        //afegeixo les noves dades
        listOfnames.append(fullString)
        
        //guardo y sincronitzp dades
        UserDefaults.standard.setValue(listOfnames, forKey: nameEmailKey)
        UserDefaults.standard.synchronize()
        
        textView.text += "\n\(fullString)"       // ho afegim al textview de la app
        print("saving \(fullString)")            //comprovem a consola que funciona
        
    }
  
    
// recuperem la info del disc dur
    func updateTextview() {
//        let userName = UserDefaults.standard.string(forKey: "name") ?? "Sense nom"
//        let userEmail = UserDefaults.standard.string(forKey: "email") ?? "Sense email"
//        print("\(userName); \(userEmail)")
//        textView.text  += "\n \(userName): \(userEmail)"
////        return "\(userName); \(userEmail)"
        if let storedNameAndEmails = UserDefaults.standard.stringArray(forKey: nameEmailKey) {
            for value in storedNameAndEmails {
                textView.text.append("\n" + value)
                print("Stored Value: \(value)")
            }
        }
    
        
    }
    
// per eliminar les dades del disc dur
    func resetData() {
        UserDefaults.standard.removeObject(forKey: "name")
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.synchronize()
        textView.text = ""
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
