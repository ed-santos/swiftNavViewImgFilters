//
//  ViewController.swift
//  NavigationView
//
//  Created by Ed Santos on 2019-05-30.
//  Copyright © 2019 Ed Santos. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    //struct can store properties via key/value pair
    struct orgImage {
        static var Img = UIImage.init()
    };

   
    
    @IBOutlet weak var ImgViewDisplay: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orgImage.Img = ImgViewDisplay.image!
        
    
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func DoF(_ sender: Any) {
        
        
    }
    
}

