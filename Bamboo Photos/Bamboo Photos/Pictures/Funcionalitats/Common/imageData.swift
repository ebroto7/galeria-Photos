//
//  imageData.swift
//  Bamboo Photos
//
//  Created by Enric Broto Hernandez on 24/2/21.
//

import Foundation
import UIKit

class imageData {
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
        let imageUrlName: String = url.lastPathComponent //demanem que de la url només volem el  nom
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
    //guardarà el titol que rebo per parametre a la posició que em diuen
    static func setTitle(_ title: String, position: Int)  {
        imagesTitle[position] = title
    }
    //retorna la imatge que et demano per parametre
    static func getTitle(_ position: Int) -> String {
        let title: String = imagesTitle[position]
        return title
    }
    
// FUNCIONS PEL LIKE SWITCH
    
    //guarda true a la llista de likes "likedImages" si switch es like
    static func likeImagePosition(_ position: Int) {
        likedImages[position] = true
    }
    //guarda false a la llista de likes "likedImages" si switch es dislike
    static func dislikeImageAtPosition(_ position: Int) {
        likedImages[position] = false
    }
    
    //detecta si està like o dislike
    static func getLikeForPosition(_ position: Int) -> Bool {
        let isLike: Bool = likedImages[position]
        return isLike
    }
    
    
//-------------------------------------------------------------
    
    
    
}


