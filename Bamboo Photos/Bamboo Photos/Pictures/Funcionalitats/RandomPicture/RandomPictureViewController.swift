//
//  RandomPictureViewController.swift
//  Bamboo Photos
//
//  Created by Enric Broto Hernandez on 2/3/21.
//

import UIKit

class RandomPictureViewController: UIViewController {

    @IBOutlet weak var viewImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
   //     Int.random(in: 0...imageData.numOfImages())       //generem un número aleatori en 0 i el mnumero de imatges que tenim
  
//  fem que al entrar a la pantalla ens retorni una imatge aleatoria
//        let image = imageData.imageForPosition(Int.random(in: 0...imageData.numOfImages()))
//        viewImage.image = image
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewImage.image = getRandomPicture()
    }
    
    
    func getRandomPicture() -> UIImage? {
        let minPictureIndex: Int = 0
        let maxPictureIndex: Int = imageData.numOfImages()-1
        let randomIndex: Int = Int.random(in: minPictureIndex...maxPictureIndex)
        let image: UIImage? = imageData.imageForPosition(randomIndex)
        return image
    }
    
}
