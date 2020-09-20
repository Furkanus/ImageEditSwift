//
//  ViewController.swift
//  ImageEdit
//
//  Created by Furkan Hanci on 9/20/20.
//

import UIKit
import Vision
class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var myCiImage = CIImage()
    var contrastSlider = Float()
    var brightnessSlider = Float()
    var saturationSlider = Float()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let aImage = imageView.image
        let bCIImage = aImage?.cgImage
      myCiImage = CIImage(cgImage: bCIImage!)
        
       
    }
    
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        brightnessSlider = sender.value
        filter()
        
    }
    
    
    @IBAction func slidervalue2changed(_ sender: UISlider) {
        
        contrastSlider = sender.value
        filter()
        
    }
    
    
    
    @IBAction func slidervalue3changed(_ sender: UISlider) {
        
        saturationSlider = sender.value
        filter()
        
    }
    
    func filter() {
        let newCIImaage = self.myCiImage.applyingFilter("CIColorControls" , parameters: [kCIInputBrightnessKey : brightnessSlider]).applyingFilter("CIColorControls", parameters: [kCIInputContrastKey: 1 + contrastSlider]).applyingFilter("CIColorControls", parameters: [kCIInputSaturationKey : 1 + saturationSlider])
        
        
        let newUIImage = UIImage(ciImage: newCIImaage)
        imageView.image = newUIImage
    }
    
    
    

}

