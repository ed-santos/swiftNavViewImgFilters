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
	
    
    @IBAction func Noir(_ sender: Any) {
        
        let noirImg = orgImage.Img
        let rawImage = CIImage(image: noirImg)
        
        let noirParams: [String : Any] = [kCIInputImageKey : rawImage]
        
        let noirFilter = CIFilter(name: "CIPhotoEffectNoir", parameters: noirParams)
        
        let context = CIContext(options: nil)
        
        if let output = noirFilter?.outputImage{
            
            if let ciImg = context.createCGImage(output, from: output.extent){
                
                ImgViewDisplay.image = UIImage(cgImage: ciImg)
                
            }
            
        }
    }
    
    
    @IBAction func colorControl(_ sender: Any) {
        
        let colorImg = orgImage.Img
        let rawImage = CIImage(image: colorImg)
        
        let colorParams: [String : Any] = [kCIInputImageKey : rawImage, kCIInputSaturationKey : 1.2, kCIInputBrightnessKey : 0.5, kCIInputContrastKey : 3]
        
        let colorFilter = CIFilter(name: "CIColorControls", parameters: colorParams)
        
        let context = CIContext(options: nil)
        
        if let output = colorFilter?.outputImage{
            
            if let ciImg = context.createCGImage(output, from: output.extent){
                
                ImgViewDisplay.image = UIImage(cgImage: ciImg)
                
                
            }
            
        }
        
    }
    
    
    @IBAction func comicEffect(_ sender: Any) {
        let comicImg = orgImage.Img
        let rawImage = CIImage(image: comicImg)
        
        let comicParams: [String : Any] = [kCIInputImageKey : rawImage]
        
        let comicFilter = CIFilter(name: "CIComicEffect", parameters: comicParams)
        
        let context = CIContext(options: nil)
        
        if let output = comicFilter?.outputImage{
            
            if let ciImg = context.createCGImage(output, from: output.extent){
                
                ImgViewDisplay.image = UIImage(cgImage: ciImg)
            }
            
        }
    }
    
    
    @IBAction func DoF(_ sender: Any) {
        let dofImg = orgImage.Img
        let rawImage = CIImage(image: dofImg)
        let dofParams: [String : Any] = [kCIInputImageKey : rawImage, "inputPoint0" : CIVector(string: "[0 50]"), "inputPoint1" : CIVector(string: "[75 75]"), kCIInputSaturationKey : 1, "inputUnsharpMaskRadius" : 100, "inputUnsharpMaskIntensity" : 10, kCIInputRadiusKey : 100]
        
        let dofFilter = CIFilter(name: "CIDepthOfField", parameters: dofParams)
        
        let context = CIContext(options: nil)
        
        if let output = dofFilter?.outputImage{
            
            if let ciImg = context.createCGImage(output, from: output.extent){
                
                ImgViewDisplay.image = UIImage(cgImage: ciImg)
                
            }
            
        }
        
    }
    
    @IBAction func Distort(_ sender: Any) {
        
        let distortImg = orgImage.Img
        let rawImage = CIImage(image: distortImg)
        let distortParams: [String : Any] = [kCIInputImageKey : rawImage, kCIInputCenterKey : CIVector(string: "[150 150]"), kCIInputRadiusKey : 200.00, kCIInputScaleKey : 0.70]
        
        let distortFilter = CIFilter(name: "CIBumpDistortion", parameters: distortParams)
        
        let context = CIContext(options: nil)
        
        if let output = distortFilter?.outputImage{
            
            if let ciImg = context.createCGImage(output, from: output.extent){
                
                ImgViewDisplay.image = UIImage(cgImage: ciImg)
            }
            
        }
        
    }
    
    @IBAction func reset(_ sender: Any) {
        
        ImgViewDisplay.image = orgImage.Img
        
    }
    
}

