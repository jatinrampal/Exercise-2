//
//  SubPage2.swift
//  iPhoneAppExercise2
//
//  Created by Xcode User on 2018-03-05.
//  Copyright © 2018 Xcode User. All rights reserved.
//

import UIKit
import QuartzCore

// NOTE: THIS IS THE ANIMATION

class SubPage2: UIViewController{
    
    var flyLayer : CALayer?
    var rotateLayer : CALayer?
    var fadeLayer : CALayer?
    
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        
        // Remove Animation = layer.removeAllAnimation
        flyLayer?.removeFromSuperlayer()
        rotateLayer?.removeFromSuperlayer()
        fadeLayer?.removeFromSuperlayer()
        
     
        
        //Switch
        switch segmentedControl.selectedSegmentIndex
        {
            case 0: //Rotate
               
                // This is Rotate Layer
                
                /// Making Soccer Ball
                let rotateImage = UIImage(named: "raptors.jpg")
                
                // Init Layer, Add image to layer
                rotateLayer = CALayer.init()
                rotateLayer?.contents = rotateImage?.cgImage
                rotateLayer?.bounds = CGRect(x:700, y:700, width:140, height:100)
                rotateLayer?.position = CGPoint(x: 200, y:300)
                
                self.view.layer.addSublayer(rotateLayer!)
                
                // Spin
                let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
               
                rotateAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
                // from 0 degrees
                rotateAnimation.fromValue = 0
                // to 360 degrees
                rotateAnimation.toValue = 2 * Double.pi
                
                rotateAnimation.isRemovedOnCompletion = true
                rotateAnimation.duration = 1.0
                rotateAnimation.repeatCount = Float.infinity
           
                rotateLayer?.add(rotateAnimation, forKey: nil)
                break;
            
            case 1: //Fade
        
                // This is Fade Layer
                // Making Soccer Ball
                let fadeImage = UIImage(named: "manutd.jpg")
                
                // Init Layer, Add image to layer
                fadeLayer = CALayer.init()
                fadeLayer?.contents = fadeImage?.cgImage
                fadeLayer?.bounds = CGRect(x:700, y:700, width:300, height:300)
                fadeLayer?.position = CGPoint(x: 200, y:300)
                
                self.view.layer.addSublayer(fadeLayer!)
              
                // fade animation
                let fadeAnimation = CABasicAnimation(keyPath: "opacity")
           
                fadeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
               
                // from alpha of 1.0
                fadeAnimation.fromValue = NSNumber.init(value: 1.0)
                
                // to alpha of 0.0 - invisible
                fadeAnimation.toValue = NSNumber.init(value: 0.0)
                fadeAnimation.isRemovedOnCompletion = false
                
                // 3 seconds long fade
                fadeAnimation.duration = 3.0
                fadeAnimation.beginTime = 1.0
                fadeAnimation.isAdditive = false
              
                fadeAnimation.fillMode =  kCAFillModeBoth
                fadeAnimation.repeatCount=Float.infinity
                
                fadeLayer?.add(fadeAnimation, forKey: nil)
        
                break;
            
            case 2:
                
                let flyImage = UIImage(named: "raptors.jpg")
                
                // Init Layer, Add image to layer
                flyLayer = CALayer.init()
                flyLayer?.contents = flyImage?.cgImage
                flyLayer?.bounds = CGRect(x:700, y:700, width:140, height:100)
                flyLayer?.position = CGPoint(x: 200, y:150)
                
                self.view.layer.addSublayer(flyLayer!)
                
               
                
                // movement animation
                let moveAnimation = CABasicAnimation(keyPath: "position")
                moveAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
                moveAnimation.fromValue = NSValue.init(cgPoint: CGPoint(x: 200,y: 150))
                moveAnimation.toValue = NSValue.init(cgPoint: CGPoint(x: 200, y: 630 ))
                moveAnimation.isRemovedOnCompletion = true
                
                moveAnimation.duration = 4.0
                moveAnimation.repeatCount = Float.infinity
                
                // attach animation to image layer
                flyLayer?.add(moveAnimation, forKey: nil)
                break;
            
        default:
            segmentedControl?.isHidden = true
        }
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
       
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
