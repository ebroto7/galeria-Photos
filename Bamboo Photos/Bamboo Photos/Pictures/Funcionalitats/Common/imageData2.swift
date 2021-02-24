//
//  imageData2.swift
//  Bamboo Photos
//
//  Created by Enric Broto Hernandez on 24/2/21.
//

import Foundation
import UIKit

class imageData2 {
    //li diem que importi les imatges que tenim dins el projecte
    static var imagesUrl2: [URL]? = Bundle.main.urls(forResourcesWithExtension: "jpg", subdirectory: nil)        // de tipus [URL]?  => és opcional
    
    // demanaem que compti quantes fotos hi ha
    static func numOfImages() -> Int {
        let numberImages: Int = imagesUrl2?.count ?? 0
        return numberImages
    }
    
    // quan introdueixo la url, em retorna la imatge (donam la imatge de la url x)
    static func imageForUrl(_ url: URL) -> UIImage? {
        let imageUrlName = url.lastPathComponent
        let image: UIImage? = UIImage(named: imageUrlName)
        return image
    }
    
    // utilitzant la funció "imageForUrl"
    static func imageForPosition(_ position: Int) -> UIImage? {
        guard let url: URL = imagesUrl2?[position] else { return nil }
        let image: UIImage? = imageForUrl(url)
        return image
        
    }
    
}


