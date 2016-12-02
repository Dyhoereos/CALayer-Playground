//
//  SecondViewController.swift
//  CALayerPlayground
//
//  Created by arcui on 2016-12-01.
//  Copyright © 2016 Dyhoer. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var viewForLayer: UIView!
    
    var l: CALayer {
        return viewForLayer.layer
    }
    
    let layer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // create sublayer 
        
        layer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        layer.position = CGPoint(x: l.frame.width/2, y: l.frame.height/2)
        layer.backgroundColor = UIColor.red.cgColor
        l.addSublayer(layer)
    }

    @IBAction func reset(_ sender: UIButton) {
        layer.removeAllAnimations()

        layer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        layer.position = CGPoint(x: l.frame.width/2, y: l.frame.height/2)
        layer.backgroundColor = UIColor.red.cgColor
        layer.opacity = 1.0;
    }

    @IBAction func opacityClicked(_ sender: UIButton) {
    
        // create fade animation
        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
        fadeAnimation.fromValue = NSNumber(value: 1.0)
        fadeAnimation.toValue = NSNumber(value: 0.0)
        fadeAnimation.duration = 3.0
        fadeAnimation.fillMode = kCAFillModeForwards
        fadeAnimation.isRemovedOnCompletion = false
        
        layer.add(fadeAnimation, forKey: "opacityAnimation")
    }
    @IBAction func colourClicked(_ sender: UIButton) {

        // create background colour change animation
        let backgroundAnimation = CABasicAnimation(keyPath: "backgroundColor")
        backgroundAnimation.fromValue = UIColor.red.cgColor
        backgroundAnimation.toValue = UIColor.green.cgColor
        backgroundAnimation.duration = 3.0
        backgroundAnimation.fillMode = kCAFillModeForwards
        backgroundAnimation.isRemovedOnCompletion = false

        layer.add(backgroundAnimation, forKey: "backgroundAnimation")
    }
    @IBAction func sizeClicked(_ sender: AnyObject) {

        // create size change animation
        let sizeAnimation = CABasicAnimation(keyPath: "transform.scale")
        sizeAnimation.fromValue = 0
        sizeAnimation.toValue = 1
        sizeAnimation.duration = 3.0
        layer.add(sizeAnimation, forKey: "sizeAnimation")
        

    }
    @IBAction func positionClicked(_ sender: UIButton) {

        // create position change animation
        let posAnimation = CABasicAnimation(keyPath: "transform.translation")
        posAnimation.toValue = NSValue(cgPoint: self.layer.position)
        posAnimation.fromValue = NSValue(cgPoint: CGPoint(x: 0, y: 0))
        posAnimation.duration = 3.0
        layer.add(posAnimation, forKey: "posAnimation")
    }
    
}

