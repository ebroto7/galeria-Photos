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
        let nib = UINib(nibName: reuseIdentifire, bundle: nil)      //nib = .xib //crea un nib a partir de l'
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifire)  // li diem a la collectionView que carregui a partir de l'arxiu .xib
    }
    
}

extension PicturesViewController: UICollectionViewDataSource {      //per defecte em demana el "numberOfItemsInSection" i "cellForItemAt"
    // nosaltres podem afegir el "numberOfSections"
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifire, for: indexPath)
        return cell
    }
    
    
}

extension PicturesViewController: UICollectionViewDelegate {        // d'entrada no te preestablerts necessàris com passa amb la extensió dataSource
        
}

extension PicturesViewController: UICollectionViewDelegateFlowLayout {  // d'entrada no te preestablerts necessàris com passa amb la extensió dataSource
    
    //implementem tres metodes
    
    // tamany de la cel.la
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 90, height: 90)
        return size
    }
    
    //separador entreSeccions (entre files)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let spaceForSection = CGFloat(5)
        return spaceForSection
    }
    
    //separador entre items de la manteixa fila
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let spaceInteritem = CGFloat(5)
        return spaceInteritem
    }
    
}
