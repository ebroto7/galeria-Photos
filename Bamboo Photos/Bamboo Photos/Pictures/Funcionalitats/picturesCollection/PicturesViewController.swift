//
//  PicturesViewController.swift
//  Bamboo Photos
//
//  Created by Enric Broto Hernandez on 23/2/21.
//

//  PROCÉS DE LA PANTALLA ---> PHOTOS <---
//
//comencem a crear la pantalla de PHOTOS.
//1. creem el picturesViewController i l'enllacem
//2. implementem el collection view a la pantalla i l'enllacem al codi (IBOutlet)
//3. creem la extensió "DATASOURCE" de la class per gestionar el numero de cel.les
//4. creem la extensió "DELEGATE" de la class "picturesViewController" per gestionar les dades
//5. creem la extensió "FLOWLAYOUT" de la class "picturesViewController" per gestionar el comportament (cap a on hem de fer scroll, com s'organitzen les cel.les, etc)
            // implementem el metode CGSize, per donar mides a les cel.les
            // implementem el metode spaceForSection, per donar espai a les files
            // implementem el metode spaceInteritem, per donar espai a les files
//6. a la l'storyboard sel.leccionem la collectionView, i anem a l'apartat del "cartabo" per modificar l'"stimate size", que sortia automatic i posem "none"
//7. generem l'arxiu picturesCell de tipus "cocoa" (.swift)
//8. generem l'arxiu picturesCell de tipus "view" (.xib)
            //ens carreguem el view
            //posem una collecionViewCell, la enllacem (class), li posem un backgroud de color cridaner
//9. creem la constant reuseIdentifier i la posem a la extenssió corresponent (en aquest cas DataSource)
//10. generem la constant nib dins override

import UIKit

class PicturesViewController: UIViewController {
    
    private let reuseIdentifire = String(describing: PicturesCell.self) //cada reuseIdentifier es dirà com el seva Class, així evites problemes (en el nostre cas no ho necesitem), podriem tenir diferents tipus de cel.les (per exeple cel.la de de foto i cel.la de text)

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: reuseIdentifire, bundle: nil)      //nib = .xib //crea un nib a partir de l' (.xib es com un storyBoard, d'una sola pantlla)
        // amb el .xib puc generar un component que despres reutilitzo a la meva app
            // igual que una funció em serveix per reutilitzar codi, el .xib em serveix per reutilitzar un component visual
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifire)  // li diem a la collectionView que carregui a partir de l'arxiu .xib
        
       
        
    }
    
}

extension PicturesViewController: UICollectionViewDataSource {      //per defecte em demana el "numberOfItemsInSection" i "cellForItemAt"
    // nosaltres podem afegir el "numberOfSections", en aquest cas 1 secció(innecessari pel que estem fent)
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // número de cel.les de la collectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let numOfImages = imageData.numOfImages()
        print("el nombre d'imatges és: \(numOfImages)")
        return numOfImages  // importem el numero de caselles en funció de la quantitat d'imateges que tenim a la carpeta
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifire, for: indexPath) as? PicturesCell // "as?" intenta convertir l'objecte que tenim, al tipus que li demanem (només li podem demanar si el context és adequat, no puc demanar un Int d'una String que no siguin números) // en aquest cas ens retorna un picturesCell opcional, per que no sap si ho pot convertir
//        cell?.numberView.text = String(indexPath.row)
//        return cell
        
    // com que a tot l'anterior encara tenia opcional, l'haig de trencar
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifire, for: indexPath)
        if let picturesCell = cell as? PicturesCell {
            picturesCell.numberView.text = String(indexPath.row)        //mostra el número de la imatge segons indexpath.row
            picturesCell.imageView.image = imageData.imageForPosition(indexPath.row)    //mostra la imatge segons indexpath.row
 
            return picturesCell
        } else {
            return cell
        }
    }
    
    
}

extension PicturesViewController: UICollectionViewDelegate {        // d'entrada no te preestablerts necessàris com passa amb la extensió dataSource
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//       per veure el numero de indexPath
//        let indexPath = indexPath
//        print(indexPath)
        
        let selectedPosition: Int = indexPath.row
        let imageName: String = imageData.imagesUrl?[selectedPosition].lastPathComponent ?? "imatge sensen nom"
        print("\(selectedPosition): \(imageName)")
        
        //per traspasar la informació  //en aquest cas guardem el numero de la imatge que selecciona l'usuari
        PicturesViewModel.selectedIndex = selectedPosition
        
    }
        
}

extension PicturesViewController: UICollectionViewDelegateFlowLayout {  // dona format a la cel.la // d'entrada no te preestablerts necessàris com passa amb la extensió dataSource
    //implementem tres metodes
    
    //1. tamany de la cel.la
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 90, height: 90)
        return size
    }
    
    //2. mida separador entreSeccions (entre files)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let spaceForSection = CGFloat(5)
        return spaceForSection
    }
    
    //3. mida separador entre items de la manteixa fila
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let spaceInteritem = CGFloat(5)
        return spaceInteritem
    }
    
}
