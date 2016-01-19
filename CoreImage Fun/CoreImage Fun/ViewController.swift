//
//  ViewController.swift
//  CoreImage Fun
//
//  Created by Ho Jeannie on 1/17/16.
//  Copyright © 2016 Ho Jeannie. All rights reserved.
//

import UIKit
import AssetsLibrary

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    //Variables needed for the slider action
    var context: CIContext!
    var filter: CIFilter!
    var beginImage: CIImage!

    //Save metadata
    var orientation: UIImageOrientation = .Up
    

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var amountSlider: UISlider!
    
    //delegate method
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [String:AnyObject]) {
        self.dismissViewControllerAnimated(true, completion: nil);
        
        let gotImage = info[UIImagePickerControllerOriginalImage] as! UIImage
       
        //metadata saving
        orientation = gotImage.imageOrientation
        beginImage = CIImage(image:gotImage)
        filter.setValue(beginImage, forKey: kCIInputImageKey)
        self.amountSliderValueChanged(amountSlider)
    }
    
    //delegate (cancel)
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }


    
    //Basic Image filtering
    
    //1 Create a Climage Object
    //2 Create a CIContext
    //3 Create a CIFilter
    //4 Get the ilter output
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.logAllFilters()
        // Do any additional setup after loading the view, typically from a nib.
       
        //1 Get the path to your image file
        let fileURL=NSBundle.mainBundle().URLForResource("image", withExtension: "png")
        /*
        //2 Create your Climage
        let beginImage=CIImage(contentsOfURL: fileURL!)
        //3 Create a CIFilter Image
        let filter = CIFilter(name: "CISepiaTone")
        filter?.setValue(beginImage, forKey: kCIInputImageKey)
        filter?.setValue(0.5,forKey:kCIInputIntensityKey)
        
        //4 Get the climage back out of the filter
        let newImage=UIImage(CIImage: (filter?.outputImage)!)
        self.imageView.image=newImage;
        */
        
        //Changing the code to use the slider action variables
        beginImage = CIImage(contentsOfURL: fileURL!)
        
        filter = CIFilter(name: "CISepiaTone")
        filter.setValue(beginImage, forKey: kCIInputImageKey)
        filter.setValue(0.5, forKey: kCIInputIntensityKey)
        
        let outputImage = filter.outputImage
        
        context = CIContext(options:nil)
        let cgimg = context.createCGImage(outputImage!, fromRect: outputImage!.extent)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        @IBAction func amountSliderValueChanged(sender: UISlider) {
            
            let sliderValue = sender.value
            
            filter.setValue(sliderValue, forKey: kCIInputIntensityKey)
            
            //let outputImage = filter.outputImage
            let outputImage = self.oldPhoto(beginImage, withAmount: sliderValue)

            
            let cgimg = context.createCGImage(outputImage, fromRect: outputImage.extent)
            
            let newImage = UIImage(CGImage: cgimg, scale:1, orientation:orientation)
            
            self.imageView.image=newImage;
        }
    
    @IBAction func loadPhoto(sender: UIButton) {
        let pickerC = UIImagePickerController()
        pickerC.delegate = self
        self.presentViewController(pickerC, animated: true, completion: nil)
        
    }

    @IBAction func savePhoto(sender: AnyObject) {
        //1
        let imageToSave=filter.outputImage;
        
        //2 Create a new, software based CIContext that uses the CPU renderer.
        let softwareContext = CIContext(options:[kCIContextUseSoftwareRenderer: true])
        
        //3 Generate the CIImage
        let cgimg = softwareContext.createCGImage(imageToSave!, fromRect:imageToSave!.extent)
        
        //4 Save the CIImage to photolibrary
        let library = ALAssetsLibrary()
        library.writeImageToSavedPhotosAlbum(cgimg,
            metadata:imageToSave!.properties,
            completionBlock:nil)
    }
    
    //loggingFilters
    
    func logAllFilters() {
        let properties = CIFilter.filterNamesInCategory(kCICategoryBuiltIn)
        print(properties)
        
        for filterName: AnyObject in properties {
            let fltr = CIFilter(name:filterName as! String)
            print(fltr!.attributes)
        }
    }
    
    func oldPhoto(img: CIImage, withAmount intensity: Float) -> CIImage {
        // 1
        let sepia = CIFilter(name:"CISepiaTone")
        sepia!.setValue(img, forKey:kCIInputImageKey)
        sepia!.setValue(intensity, forKey:"inputIntensity")
        
        // 2
        let random = CIFilter(name:"CIRandomGenerator")
        
        // 3
        let lighten = CIFilter(name:"CIColorControls")
        lighten!.setValue(random!.outputImage, forKey:kCIInputImageKey)
        lighten!.setValue(1 - intensity, forKey:"inputBrightness")
        lighten!.setValue(0, forKey:"inputSaturation")
        
        // 4
        let croppedImage = lighten!.outputImage!.imageByCroppingToRect(beginImage.extent)
        
        // 5
        let composite = CIFilter(name:"CIHardLightBlendMode")
        composite!.setValue(sepia!.outputImage!, forKey:kCIInputImageKey)
        composite!.setValue(croppedImage, forKey:kCIInputBackgroundImageKey)
        
        // 6
        let vignette = CIFilter(name:"CIVignette")
        vignette!.setValue(composite!.outputImage!, forKey:kCIInputImageKey)
        vignette!.setValue(intensity * 2, forKey:"inputIntensity")
        vignette!.setValue(intensity * 30, forKey:"inputRadius")
        
        // 7
        return vignette!.outputImage!
    }
        
}


