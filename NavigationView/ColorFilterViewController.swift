//
//  ColorFilterViewController.swift
//  NavigationView
//
//  Created by Ed Santos on 2019-05-31.
//  Copyright © 2019 Ed Santos. All rights reserved.
//

import UIKit

class ColorFilterViewController: UIViewController {
    
    
    @IBOutlet weak var ColorImgView: UIImageView!
    
    
    @IBOutlet weak var brightness: UISlider!
    
    @IBOutlet weak var contrast: UISlider!
    
    @IBOutlet weak var saturation: UISlider!
    
    struct orgImage {
        static var Img = UIImage.init()
    };

    override func viewDidLoad() {
        super.viewDidLoad()

        orgImage.Img = ColorImgView.image!
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func ColorFilter(_ sender: Any) {
        
        let bright = Decimal(brightness.value)
        let con = Decimal(contrast.value)
        let sat = Decimal(saturation.value)
        
        let colorImg = orgImage.Img
        let rawImage = CIImage(image: colorImg)
        
        let colorParams: [String : Any] = [kCIInputImageKey : rawImage, kCIInputSaturationKey : sat, kCIInputBrightnessKey : bright, kCIInputContrastKey : con]
        
        let colorFilter = CIFilter(name: "CIColorControls", parameters: colorParams)
        
        let context = CIContext(options: nil)
        
        if let output = colorFilter?.outputImage{
            
            if let ciImg = context.createCGImage(output, from: output.extent){
                
                ImgViewDisplay.image = UIImage(cgImage: ciImg)
                
                
            }
            
        }
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
