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
    
  //  private var cellHeight: CGFloat = 90    //variable que dona valor a la mida de la cel.la
    //com que ara modifiquem l'ample de les cel.les en funció de les imatges que volem en cada vista, ja no utilitzem la variable
    
    private let reuseIdentifire = String(describing: PicturesCell.self) //cada reuseIdentifier es dirà com el seva Class, així evites problemes (en el nostre cas no ho necesitem), podriem tenir diferents tipus de cel.les (per exeple cel.la de de foto i cel.la de text)
    private var numOfHorzontalCells: CGFloat = 5.0
    private var marginBetweenCells: CGFloat = 5.0
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var butonsStackView: UIStackView!
    @IBOutlet weak var listButton: UIButton!
    @IBOutlet weak var columnButton: UIButton!
    @IBOutlet weak var smallColumnButton: UIButton!
    @IBOutlet weak var verySmallColumnButton: UIButton!
    @IBOutlet weak var ContainerVisualEfectButonsView: UIView!
    
    @IBOutlet var llistaBotons: [UIButton]!
    
    
    @IBAction func buttonGridOptions(_ sender: UIButton) {      //sender és el botò clicat
//        print(sender.titleLabel?.text)
//        print(sender.tag)
      //opció 1
//        if  sender.tag == 0 {
//            print("1r botó")
//
//        } else  if  sender.tag == 1 {
//            print("2n botó")
//
//        } else  if  sender.tag == 2 {
//            print("3r botó")
//
//        } else  if  sender.tag == 3 {
//            print("4t botó")
//
//        } else {
//            print("")
//        }
        
    //opció 2
//        switch sender.tag {
//        case 0 :
//            print("1r - botó")
//            cellHeight = 320
//
//        case 1:
//            print("2n - botó")
//            cellHeight = 155
//
//        case 2:
//            print("3r - botó")
//            cellHeight = 75
//
//        case 3:
//            print("4t - botó")
//            cellHeight = 35
//
//        default:
//            print("hola")
//    }
        changeViewByButton(tag: sender.tag)
        
        //desseleccionem els botons
//        // si ho fem individualment per botons cadascun amb el seu outlet
//        listButton.isSelected = false
//        columnButton.isSelected = false
//        smallColumnButton.isSelected = false
//        verySmallColumnButton.isSelected = false
//        
        //havent generat un llista de butons
//
//        for button in llistaBotons {
//            button.isSelected = false
//        }
//
//        sender.isSelected = true        //el boto selecionat està marcat
        
        selectedButton(sender: sender)
        
        collectionView.reloadData() //torna a carregar la coleccition view
    }
    
    func selectedButton(sender: UIButton) {
        for button in llistaBotons {
            button.isSelected = false
        }
        sender.isSelected = true
        
        
    }
    
    func changeViewByButton(tag: Int)  {
        switch tag {
        case 0 :
            print("1r - botó")
            numOfHorzontalCells = 1
   
        case 1:
            print("2n - botó")
            numOfHorzontalCells = 2
   
        case 2:
            print("3r - botó")
            numOfHorzontalCells = 4
       
        case 3:
            print("4t - botó")
            numOfHorzontalCells = 8
          
        default:
            print("hola")
        }
        collectionView.reloadData()
    }
    
//    enum GridOptions: int {
//        case list = 0, columns, grid, xsgrid
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: reuseIdentifire, bundle: nil)      //nib = .xib //crea un nib a partir de l' (.xib es com un storyBoard, d'una sola pantlla)
        // amb el .xib puc generar un component que despres reutilitzo a la meva app
            // igual que una funció em serveix per reutilitzar codi, el .xib em serveix per reutilitzar un component visual
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifire)  // li diem a la collectionView que carregui a partir de l'arxiu .xib
        
        ContainerVisualEfectButonsView.layer.cornerRadius = 20
    //    butonsStackView.layer.cornerRadius = 20     //arodonim les cantonades de l'stackview dels botons
       
        selectedButton(sender: listButton)
        changeViewByButton(tag: 0)
        
       
        PicturesViewModel.textProbes = "Hola"     //probando cosas
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super .viewWillTransition(to: size, with: coordinator)
        
        let orientacion = UIDevice.current.orientation
        // amb el switch podem descubrir les opcions que tenim, pero no ens interesa perque nomes volem comprobar les posicions horitzontal i vertical (portrait - landscape)
        //        switch orientacion {
        //
        //        case .unknown:
        //            print("orientació: unknown")
        //        case .portrait:
        //            print("orientació: portrait")
        //        case .portraitUpsideDown:
        //            print("orientació: upsidedown")
        //        case .landscapeLeft:
        //            print("orientació: landscape")
        //        case .landscapeRight:
        //            print("orientació: landscapeRigth")
        //        case .faceUp:
        //            print("orientació: faceUp")
        //        case .faceDown:
        //            print("orientació: faceDown")
        //        @unknown default:
        //            print("orientació: desconeguda")
        
        //comprobem les orientacions que ens interesen
//        if orientacion.isPortrait == true {
//            print("la orientació es vertical")
//        } else if orientacion.isLandscape == true {
//            print("la orientació es horitzontal")
//        }
       
        //simplificat, d'aquesta manera només controlo que quan la pantalla és horitzontal modifiqui el que necesiti
       // printem per comprobar que funciona
//        if orientacion.isLandscape  {
//            print("la orientació es horitzontal")
//        } else {
//            print("la orientació es vertical")
//        }
        
       
        //solució "guard let"
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        if UIDevice.current.orientation.isLandscape {
            layout.scrollDirection = .horizontal
        } else if UIDevice.current.orientation.isPortrait {
            layout.scrollDirection = .vertical
        }
        
       // solució "if let"
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
        if orientacion.isLandscape  {
            layout.scrollDirection = .horizontal
            print("la orientació es horitzontal")
        } else {
            layout.scrollDirection = .vertical
            print("la orientació es vertical")
        }
        }

        
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
        
        //guardem la casella seleccionada en un constant
        let selectedPosition: Int = indexPath.row
        //per traspasar la informació  //en aquest cas guardem el numero de la imatge que selecciona l'usuari
        PicturesViewModel.selectedIndex = selectedPosition
        // per enllaçar la imatge amb la pantalla de detall
        performSegue(withIdentifier: "segueToDetail", sender: nil)
        
        
        let imageName: String = imageData.imagesUrl?[selectedPosition].lastPathComponent ?? "imatge sensen nom"
        print("\(selectedPosition) : \(imageName)")
        
    }
        
}

extension PicturesViewController: UICollectionViewDelegateFlowLayout {  // dona format a la cel.la // d'entrada no te preestablerts necessàris com passa amb la extensió dataSource
    //implementem tres metodes
    
    //1. tamany de la cel.la
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let size = CGSize(width: cellHeight, height: cellHeight)
//        return size
        
//        //sense tenir en compte marges
//        let collectionWidth: CGFloat = collectionView.frame.size.width // et diu l'ample de la pantalla
//        let cellWidth: CGFloat = collectionWidth / numOfHorzontalCells
//        return CGSize(width: cellWidth, height: cellWidth)
        
        //tenint en compte els marges
        let collectionWidth: CGFloat = collectionView.frame.size.width
        let cellWidth: CGFloat = (collectionWidth - (numOfHorzontalCells-1)*marginBetweenCells) / numOfHorzontalCells
        return CGSize(width: cellWidth, height: cellWidth)
        
        
    }
    
    //2. mida separador entreSeccions (entre files)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let spaceForSection = marginBetweenCells
        return spaceForSection
    }
    
    //3. mida separador entre items de la manteixa fila
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let spaceInteritem = marginBetweenCells
        return spaceInteritem
    }
    
    
    
    
//--------------------- PROBES ---------------------
    
    
    
    
}
