//
//  DoFfilterController.swift
//  NavigationView
//
//  Created by Ed Santos on 2019-06-04.
//  Copyright © 2019 Ed Santos. All rights reserved.
//

import UIKit

class DoFfilterController: UIViewController {
    
    @IBOutlet weak var ImgViewDisplay: UIImageView!
    
    @IBOutlet weak var saturation: UISlider!
    
    @IBOutlet weak var inputRadius: UISlider!
    
    @IBOutlet weak var maskRadius: UISlider!
    
    @IBOutlet weak var maskIntensity: UISlider!
    
    struct orgImage {
        static var Img = UIImage.init()
    };
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orgImage.Img = ImgViewDisplay.image!

        // Do any additional setup after loading the view.
    }
    
    @IBAction func reset(_ sender: Any) {
        
        saturation.value = 0
        inputRadius.value = 0
        maskRadius.value = 0
        maskIntensity.value = 0
        
        ImgViewDisplay.image = orgImage.Img
        
    }
    
    
    @IBAction func satSlider(_ sender: Any) {
        
        applyDOF()
        
    }
    
    
    @IBAction func inRadiusSlider(_ sender: Any) {
        
        applyDOF()
        
    }
    
    
    @IBAction func maskRadiusSlider(_ sender: Any) {
        
        applyDOF()
        
    }
    
    @IBAction func maskIntensity(_ sender: Any) {
        
        applyDOF()
        
    }
    
    func applyDOF(){
        
        let sat = Float(saturation.value)
        let iRadius = Float(inputRadius.value)
        let mRadius = Float(maskRadius.value)
        let mIntensity = Float(maskIntensity.value)
        
        let dofImg = orgImage.Img
        let rawImage = CIImage(image: dofImg)
        let dofParams: [String : Any] = [kCIInputImageKey : rawImage, "inputPoint0" : CIVector(string: "[0 50]"), "inputPoint1" : CIVector(string: "[75 75]"), kCIInputSaturationKey : sat, "inputUnsharpMaskRadius" : mRadius, "inputUnsharpMaskIntensity" : mIntensity, kCIInputRadiusKey : iRadius]
        
        let dofFilter = CIFilter(name: "CIDepthOfField", parameters: dofParams)
        
        let context = CIContext(options: nil)
        
        if let output = dofFilter?.outputImage{
            
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
