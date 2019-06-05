//
//  DistortFilterController.swift
//  NavigationView
//
//  Created by Ed Santos on 2019-06-04.
//  Copyright © 2019 Ed Santos. All rights reserved.
//

import UIKit

class DistortFilterController: UIViewController {
    
    @IBOutlet weak var ImgViewDisplay: UIImageView!
    
   
    @IBOutlet weak var radius: UISlider!
    
    
    @IBOutlet weak var scale: UISlider!
    
    struct orgImage {
        static var Img = UIImage.init()
    };
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orgImage.Img = ImgViewDisplay.image!

        // Do any additional setup after loading the view.
    }
    

    @IBAction func reset(_ sender: Any) {
    
        radius.value = 300
        scale.value = 0.5
        
        ImgViewDisplay.image = orgImage.Img
        
    }
    
    
    @IBAction func radiusParam(_ sender: Any) {
        
        applyDistort()
        
        print("Hello")
        
    }
    
    
    @IBAction func scaleParam(_ sender: Any) {
        
        applyDistort()
        print("Hello")
        
    }
    
    func applyDistort(){
        
        let distortImg = orgImage.Img
        let rawImage = CIImage(image: distortImg)
        let distortParams: [String : Any] = [kCIInputImageKey : rawImage, kCIInputCenterKey : CIVector(string: "[50 50]"), kCIInputRadiusKey : radius, kCIInputScaleKey : scale]
        
        let distortFilter = CIFilter(name: "CIBumpDistortion", parameters: distortParams)
        
        let context = CIContext(options: nil)
        
        if let output = distortFilter?.outputImage{
            
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
