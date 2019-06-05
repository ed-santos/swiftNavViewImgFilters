//
//  ComicFilterController.swift
//  NavigationView
//
//  Created by Ed Santos on 2019-06-04.
//  Copyright © 2019 Ed Santos. All rights reserved.
//

import UIKit

class ComicFilterController: UIViewController {

    @IBOutlet weak var beforeImg: UIImageView!
    
    @IBOutlet weak var afterImg: UIImageView!
    
    struct orgImage {
        static var Img = UIImage.init()
    };
    
    func comic(){
        
        let comicImg = orgImage.Img
        let rawImage = CIImage(image: comicImg)
        
        let comicParams: [String : Any] = [kCIInputImageKey : rawImage]
        
        let comicFilter = CIFilter(name: "CIComicEffect", parameters: comicParams)
        
        let context = CIContext(options: nil)
        
        if let output = comicFilter?.outputImage{
            
            if let ciImg = context.createCGImage(output, from: output.extent){
                
                afterImg.image = UIImage(cgImage: ciImg)
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orgImage.Img = beforeImg.image!
        
        comic()
        
        // Do any additional setup after loading the view.
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
