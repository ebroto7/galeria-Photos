//
//  PictureFromUserViewController.swift
//  Bamboo Photos
//
//  Created by Enric Broto Hernandez on 3/3/21.
//

import UIKit


class PictureFromUserViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = ImageData.imageForPosition(0)
    }
    
    @IBAction func button(_ sender: Any) {
        let picker = UIImagePickerController()
        
        picker.delegate = self 
        picker.allowsEditing = true
        picker.mediaTypes = ["public.image"]
        
        present(picker, animated: true, completion: { print("picker")})

    }
    
    
    
}

extension PictureFromUserViewController: UIImagePickerControllerDelegate {

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        self.pickerController(picker, didSelect: nil)
        print("cancel")
       dismiss(animated: true)
    }

    public func imagePickerController(_ picker: UIImagePickerController,
                                      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else {
          return
//          return self.pickerController(picker, didSelect: nil)
        }
        imageView.image = image
//        self.pickerController(picker, didSelect: image)
        dismiss(animated: true)
        print("picker hello")
    }
}

extension PictureFromUserViewController: UINavigationControllerDelegate {

}
