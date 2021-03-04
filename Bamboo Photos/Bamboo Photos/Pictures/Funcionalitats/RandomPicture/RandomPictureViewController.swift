//
//  RandomPictureViewController.swift
//  Bamboo Photos
//
//  Created by Enric Broto Hernandez on 2/3/21.
//

import UIKit
import Foundation

class RandomPictureViewController: UIViewController {

    @IBOutlet weak var titleContainerView: UIView!
    @IBOutlet weak var viewImage: UIImageView!
    var timer: Timer?
    
    @IBOutlet var labelTitulo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cornerRadius: CGFloat = 30
        titleContainerView.layer.cornerRadius = cornerRadius
        
        self.view.backgroundColor = .black          // canviem per codi el color de fons
      // AAA  viewImage.image = getRandomPicture()
      
        let randomNumber = getRandomPictureIndex()
        let image = ImageData.imageForPosition(randomNumber)
        let title = ImageData.getTitle(randomNumber)
        viewImage.image = image
        labelTitulo.text = title
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //     Int.random(in: 0...imageData.numOfImages())       //generem un número aleatori entre 0 i el número d'imatges que tenim
       
     //  fem que a l'entrar a la pantalla ens retorni una imatge aleatoria
     //        let image = imageData.imageForPosition(Int.random(in: 0...imageData.numOfImages()))
     //        viewImage.image = image
             
           
        
//        viewImage.image = getRandomPicture()    // ho posem al viewDidAppear perque volem que cada com que aparegui la pantalla, carregui un la imatge diferent
        
//        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(sayHello), userInfo: nil, repeats: true)        //  creem i activem el temporitzador un cop hem entrat a la pantalla, SISTEMA ANTIC AMB Target I #Selector
        
        // el mateix timer d'abans escrit de manera més "moderna"
        timer = Timer.scheduledTimer(withTimeInterval: 5.0,
                                     repeats: true,
                                     block: { _ in
                                        self.sayHello()
        })
    }
    
    @objc func sayHello() {
        UIView.transition(with: viewImage,
                          duration: 1.5,
                          options: [.transitionCrossDissolve],
                          animations: {
                            let randomNumber = self.getRandomPictureIndex()
                            let image = ImageData.imageForPosition(randomNumber)
                            let title = ImageData.getTitle(randomNumber)
                            self.viewImage.image = image
                            self.labelTitulo.text = title
                            
                          },
                          completion: {_ in print("hello")
                          })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        timer?.invalidate()         //aturem el temporitzador quan hem sortit de la pantalla
    }
    
//    func getRandomPicture() -> UIImage? {
//        let minPictureIndex: Int = 0
//        let maxPictureIndex: Int = ImageData.numOfImages()-1
//        let randomIndex: Int = Int.random(in: minPictureIndex...maxPictureIndex)
//        let image: UIImage? = ImageData.imageForPosition(randomIndex)
//        return image
//    }
    
    func getRandomPictureIndex() -> Int {
        let randomIndex = Int.random(in: 0...ImageData.numOfImages()-1)
        return randomIndex
    }
    
}
