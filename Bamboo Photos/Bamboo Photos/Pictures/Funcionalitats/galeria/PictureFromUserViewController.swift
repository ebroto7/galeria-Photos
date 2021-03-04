//
//  PictureFromUserViewController.swift
//  Bamboo Photos
//
//  Created by Enric Broto Hernandez on 3/3/21.
//

import UIKit


class PictureFromUserViewController: UIViewController {
    
    private let cameraType = 0
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var switchEditable: UISwitch!
    @IBOutlet weak var segmentCameraOrGalery: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = ImageData.imageForPosition(0)
    }
    
    @IBAction func button(_ sender: Any) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        
        if switchEditable.isOn {
            picker.allowsEditing = true
        } else {
        picker.allowsEditing = false
        }
        
        picker.mediaTypes = ["public.image"]
        
        
        
        if segmentCameraOrGalery.selectedSegmentIndex == cameraType {       //private let cameraType = 0 => generem una constant per evitar tenir un numero "tirat" per aqui que podem no saber a que es refereix
            if UIImagePickerController.isSourceTypeAvailable(.camera) == true {
                picker.sourceType = .camera
            } else {
                picker.sourceType = .photoLibrary
            }
            
            
            
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: { print("picker")})
        
       
        
        
    }
    
}

extension PictureFromUserViewController: UIImagePickerControllerDelegate {
    
    //modifica el comportament el botó "cancel"
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        print("cancel")
        dismiss(animated: true)
    }
    
    // modifica el control de la imatge
    public func imagePickerController(_ picker: UIImagePickerController,
                                      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        
        if picker.allowsEditing == false {
            guard let image = info[.originalImage] as? UIImage else {
                dismiss(animated: true)
                return
            }
            imageView.image = image
        } else if picker.allowsEditing == true {
            guard let image = info[.editedImage] as? UIImage else {
                dismiss(animated: true)
                
                return
            }
            imageView.image = image
        }
       
// escrit d'una altra manera
//        var image: UIImage?
//        if picker.allowsEditing {
//            image = info[.editedImage] as? UIImage
//        } else {
//            image = info[.originalImage] as? UIImage
//        }
//        imageView.image = image

        
//resumint el mateix (escrit amb el el "if else" comprimit)
//        let image = picker.allowsEditing ? info[.editedImage] : info[.originalImage]
//        imageView.image = (image as? UIImage)
        
        
        dismiss(animated: true)
        print("picker hello")
    }
    
    
    
    
    
}


extension PictureFromUserViewController: UINavigationControllerDelegate {
    
}

