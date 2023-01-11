//
//  ViewController.swift
//  ImagePickerDemo
//
//  Created by Parth Lunagariya on 11/01/23.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    //MARK: Outlet
    
    @IBOutlet weak var imgPicked: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: Button click events
    
    @IBAction func clickOnChoseImg(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        
        let alert = UIAlertController(title: "Add a photo", message: "Please Select an option", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "From photo library", style: .default, handler: { (_) in
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true)
        }))
        
        alert.addAction(UIAlertAction(title: "Open camera", style: .default, handler: { (_) in
            picker.sourceType = .camera
            self.present(picker, animated: true)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { (_) in
            print("User click Dismiss button")
        }))
        
        self.present(alert, animated: true,completion: nil)
        
    }
    
    //MARK: ImagePicker Delegate methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImg = info[.originalImage] as? UIImage{
            
            imgPicked.image = pickedImg
            
        }else if let pickedImg = info[.editedImage] as? UIImage{
            
            imgPicked.image = pickedImg
            
        }
        
        dismiss(animated: true)
    }
}

