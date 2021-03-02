//
//  PicturesFullScreenViewController.swift
//  Bamboo Photos
//
//  Created by Enric Broto Hernandez on 24/2/21.
//

import UIKit

class PicturesFullScreenViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var fullImageView: UIImageView!
    @IBOutlet weak var likeSwitch: UISwitch!
    
    
    
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)        //per amagar la pantalla quan cliquem el botó
    }
    
    
    @IBAction func switchAction(_ sender: Any) {
        guard let imageIndex: Int = PicturesViewModel.selectedIndex else { return }
        if likeSwitch.isOn {
            ImageData.likeImagePosition(imageIndex)
            print("t'ha agradat la imatge")
        } else {
            ImageData.dislikeImageAtPosition(imageIndex)
            print("ja no t'agrada")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        likeSwitch.isOn = false     // per començar amb el switch apagat/tancat/dislike
        
        print("Has tocat la casella: \(PicturesViewModel.selectedIndex)")
        
        //        //generem constant on guardar la imatge que importem
        //        let image: UIImage? = imageData.imageForPosition(PicturesViewModel.selectedIndex)
        
        // com que l'anterior "image" es opcional, el trenquem
        if let imageIndex: Int = PicturesViewModel.selectedIndex {
            let image: UIImage? = ImageData.imageForPosition(imageIndex)
            fullImageView.image = image
            
            let title: String = ImageData.getTitle(imageIndex)
            nameTextField.text = title
            
            let islike: Bool = ImageData.getLikeForPosition(imageIndex)
            likeSwitch.isOn = islike
        }
        
        
            nameTextField.resignFirstResponder()
        
//        //opció 1 per trencar l'opcional
//        print(PicturesViewModel.textProbes!)
//
//        //opciò 2
//        print(PicturesViewModel.textProbes ?? "no hi ha resultat")
//
//        //opció 3
//        if let text: String = PicturesViewModel.textProbes {
//        print(text)
//        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        if let imageIndex: Int = PicturesViewModel.selectedIndex,
           let title: String = nameTextField.text {
            ImageData.setTitle(title, position: imageIndex)
            
        }
        
    }
    
    
}

extension PicturesFullScreenViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            nameTextField.resignFirstResponder()
        }
        
        return true
    }
}







//_________________________________________________________
//
//extension EmailViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
////        print("has clicat return")
//        if textField == nameTextfield {
////            print("has introduit \(nameTextfield.text)")
//            emailTextfield.becomeFirstResponder()
//        } else if  textField == emailTextfield{
////            print("has introdiut el \(emailTextfield.text)")
//            emailTextfield.resignFirstResponder()
//        } else {
//            print("no se que has clicat")
//        }
//
//        return true
//    }
//}
