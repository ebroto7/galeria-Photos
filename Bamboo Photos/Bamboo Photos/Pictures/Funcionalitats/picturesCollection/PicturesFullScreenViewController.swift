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
    print("sortim de la pantalla")
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

        likeSwitch.isOn = false
        
    }
    


}
