//
//  imageData.swift
//  Bamboo Photos
//
//  Created by Enric Broto Hernandez on 24/2/21.
//

import Foundation

class imageData {
    //li diem que importi les imatges que tenim dins el projecte
    static var imagesUrl: [URL]? = Bundle.main.urls(forResourcesWithExtension: "jpg", subdirectory: nil)        // de tipus [URL]?  => és opcional
    
    // demanaem que compti quantes fotos hi ha
    static func numOfImages() -> Int {
        let numOfImages: Int = imagesUrl?.count ?? 0  //com que imagesUrl és opcional, l'hem de trencar, en aquest cas es fàcil perquè si no hi ha imatges ens retorna "0"
        return numOfImages
    }
}
