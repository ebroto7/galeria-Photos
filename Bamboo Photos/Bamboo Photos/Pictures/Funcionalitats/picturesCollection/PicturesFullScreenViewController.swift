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
        if likeSwitch.isOn {
        print("t'ha agradat la imatge")
        } else {
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
            let image: UIImage? = imageData.imageForPosition(imageIndex)
            fullImageView.image = image
        }
        
        
        
        
    }
    
    
    
    
  
}

