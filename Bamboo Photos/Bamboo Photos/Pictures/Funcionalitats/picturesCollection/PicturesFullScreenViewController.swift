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
            imageData.likeImagePosition(imageIndex)
            print("t'ha agradat la imatge")
        } else {
            imageData.dislikeImageAtPosition(imageIndex)
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
            
            let title: String = imageData.getTitle(imageIndex)
            nameTextField.text = title
            
            let islike: Bool = imageData.getLikeForPosition(imageIndex)
            likeSwitch.isOn = islike
        }
        
        
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        if let imageIndex: Int = PicturesViewModel.selectedIndex,
           let title: String = nameTextField.text {
            imageData.setTitle(title, position: imageIndex)
            
        }
        
    }
    
    
    
    
}

