//
//  ImgUploadViewController.swift
//  NavigationView
//
//  Created by Ed Santos on 2019-06-05.
//  Copyright © 2019 Ed Santos. All rights reserved.
//

import UIKit



class ImgUploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var ImgViewDisplay: UIImageView!
    
    var imgPicker = UIImagePickerController()
    
    var userSelection: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgPicker.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func imgUpload(_ sender: Any) {
        
        imgPicker.sourceType = .photoLibrary
        imgPicker.allowsEditing = true
        
        present(imgPicker, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFilterPage" {
            let dvc = segue.destination as! NoirFilterController
            dvc.newImage = userSelection        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if (info[UIImagePickerController.InfoKey.originalImage] as? UIImage != nil){
            
            let userSelection = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            
            ImgViewDisplay.image = userSelection
            
            dismiss(animated: true, completion: nil)
            }
        }
        
    @IBAction func next(_ sender: Any) {
        
        performSegue(withIdentifier: "toFilterPage", sender: nil)
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

