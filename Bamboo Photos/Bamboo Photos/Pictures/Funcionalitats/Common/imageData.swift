//
//  imageData.swift
//  Bamboo Photos
//
//  Created by Enric Broto Hernandez on 24/2/21.
//

import Foundation
import UIKit

class ImageData {
    //li diem que importi les imatges que tenim dins el projecte
    static var imagesUrl: [URL]? = Bundle.main.urls(forResourcesWithExtension: "jpg", subdirectory: nil)        // de tipus [URL]?  => és opcional
    private static var imagesTitle: [String] = [String](repeating: "Foto sin título", count: numOfImages()) //llistat d'Strings amb parametres: valors per defecte per a totes les imatges (utilitza un constructor per arrays, que inicialitza amb el valor que li dones per el numero de repeticions que li introdueixes). en aquest cas li donem el valor  "Foto sin título" por el numero de fotos que tenemos.
    private static var likedImages: [Bool] = [Bool](repeating: false, count: numOfImages()) //igual que l'anterior per comprobar el likeswitch
    
    
    // demanaem que compti quantes fotos hi ha
    static func numOfImages() -> Int {
        let numOfImages: Int = imagesUrl?.count ?? 0  //com que imagesUrl és opcional, l'hem de trencar, en aquest cas es fàcil perquè si no hi ha imatges ens retorna "0"
        return numOfImages
    }
    
    // quan introdueixo la url, em retorna la imatge (donam la imatge de la url x)
    static func imageForUrl(_ url: URL) -> UIImage? {
        let imageUrlName: String = url.lastPathComponent //demanem que de la url només volem el nom
        let image: UIImage? = UIImage(named: imageUrlName) //
        return image
    }
    
    // utilitzant la funció "imageForUrl"
    static func imageForPosition(_ position: Int) -> UIImage? {
        if let url: URL = imagesUrl?[position] {
            return imageForUrl(url)
        } else {
            return nil
        }
    }
    
    // FUNCIONS PEL TITOL DE LA IMATGE
    //guardarà el títol que rebo per parametre a la posició que em diuen
    static func setTitle(_ title: String, position: Int)  {
        if var storedTitles: [String] = titlesFromUserDefaults() {
            storedTitles[position] = title
            UserDefaults.standard.setValue(storedTitles, forKey: imagesTitleKey)
            UserDefaults.standard.synchronize()
        }
        
        
    }
    //retorna la imatge que et demano per parametre
    static func getTitle(_ position: Int) -> String {
        guard let title: [String] = titlesFromUserDefaults() else {
            return "Foto sin titulo"
        }
        
        return title[position]
    }
    
    // FUNCIONS PEL LIKE SWITCH
    
    //guarda true a la llista de likes "likedImages" si switch es like
    static func likeImagePosition(_ position: Int) {
        if var storedLikes: [Bool] = likesFromUserDefaults() {
            storedLikes[position] = true
        
        UserDefaults.standard.setValue(storedLikes, forKey: likeImagesKey)
        UserDefaults.standard.synchronize()
        }

    }
    //guarda false a la llista de likes "likedImages" si switch és dislike
    static func dislikeImageAtPosition(_ position: Int) {
        if var storedLikes: [Bool] = likesFromUserDefaults() {
            storedLikes[position] = false
        
        UserDefaults.standard.setValue(storedLikes, forKey: likeImagesKey)
        UserDefaults.standard.synchronize()
        }

    }
    
    //detecta si està like o dislike
    static func getLikeForPosition(_ position: Int) -> Bool {
        
        guard let storedLikes: [Bool] = likesFromUserDefaults() else { return false }
        return storedLikes[position]
        
    }
    
    
    //----------------------per salvar titol i like/dislike a UserDefaults-------------------------------
    static let imagesTitleKey = "titleKey"
    static let likeImagesKey = "likeKey"
    
    static func initUserDefaults() {
        let storedTitles: [String]? = titlesFromUserDefaults()
        if storedTitles == nil {
            let defaultTitles: [String] = [String](repeating: "Foto sin título", count: numOfImages())
            UserDefaults.standard.set(defaultTitles, forKey: imagesTitleKey)
            UserDefaults.standard.synchronize()
        }
        
        let storedLikes: [Bool]? = likesFromUserDefaults()
        if storedLikes == nil {
            let defualtLikes: [Bool] = [Bool](repeating: false, count: numOfImages())
            UserDefaults.standard.setValue(defualtLikes, forKey: likeImagesKey)
            UserDefaults.standard.synchronize()
        }
        
        
    }
    
    static func titlesFromUserDefaults() -> [String]? {
        return UserDefaults.standard.stringArray(forKey: imagesTitleKey)
    }
    
    static func likesFromUserDefaults() -> [Bool]? {
        return UserDefaults.standard.array(forKey: likeImagesKey) as? [Bool]
    }
    
}


