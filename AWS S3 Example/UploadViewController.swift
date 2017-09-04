//
//  UploadViewController.swift
//  AWS S3 Example
//
//  Created by Ameenah Burhan on 9/3/17.
//  Copyright © 2017 Ameenah Burhan. All rights reserved.
//

import UIKit
//TODO: import AWSS3

class UploadViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    let picker = UIImagePickerController()
    //TODO: Create a TransferManager instance
    //TODO: Setup S3 bucket "let S3BucketName = "YOUR BUCKET NAME""

    var localPath: URL!
    var selectedImage: UIImage!{
        didSet{
            saveButton.isEnabled = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
         picker.delegate = self
    }
    @IBAction func photoLibrary(_ sender: Any) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }
    @IBAction func saveButton(_ sender: Any) {
        //TODO: when save button is pressed upload files to S3
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
        if let image = (info[UIImagePickerControllerOriginalImage] as? UIImage){
            selectedImage = image
            imageView.image = selectedImage
        }
        dismiss(animated:true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    
}
