//
//  RandomPictureViewController.swift
//  Bamboo Photos
//
//  Created by Enric Broto Hernandez on 2/3/21.
//

import UIKit
import Foundation

class RandomPictureViewController: UIViewController {

    @IBOutlet weak var viewImage: UIImageView!
    var timer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewImage.image = getRandomPicture()
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //     Int.random(in: 0...imageData.numOfImages())       //generem un número aleatori en 0 i el mnumero de imatges que tenim
       
     //  fem que al entrar a la pantalla ens retorni una imatge aleatoria
     //        let image = imageData.imageForPosition(Int.random(in: 0...imageData.numOfImages()))
     //        viewImage.image = image
             
           
        
//        viewImage.image = getRandomPicture()    // ho posem al viewDidAppear perque volem que cada com que aparegui la pantalla, carregui un la imatge diferent
        
//        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(sayHello), userInfo: nil, repeats: true)        //  creem i activem el temporitzador un cop hem entrat a la pantalla, SISTEMA ANTIC AMB Target I #Selector
        
        // el mateix timer d'abans escrit de manera mes "moderna"
        timer = Timer.scheduledTimer(withTimeInterval: 3.0,
                                     repeats: true,
                                     block: { _ in
                                        self.sayHello()
        })
    }
    
    @objc func sayHello() {
        viewImage.image = getRandomPicture()
//        timer?.invalidate()         // per aturar el timer
        print("hello")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        timer?.invalidate()         //aturem el temporitzador quan hem sortit de la pantalla
    }
    
    func getRandomPicture() -> UIImage? {
        let minPictureIndex: Int = 0
        let maxPictureIndex: Int = imageData.numOfImages()-1
        let randomIndex: Int = Int.random(in: minPictureIndex...maxPictureIndex)
        let image: UIImage? = imageData.imageForPosition(randomIndex)
        return image
    }
    
}
