//
//  FirstViewController.swift
//  CALayerPlayground
//
//  Created by arcui on 2016-12-01.
//  Copyright © 2016 Dyhoer. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
 
    @IBOutlet weak var viewForLayer: UIView!
    @IBOutlet weak var gravitySlider: UISlider!
    @IBOutlet weak var cornersSlider: UISlider!
    @IBOutlet weak var shadowSlider: UISlider!
    @IBOutlet weak var borderSlider: UISlider!
    
    var l: CALayer {
        return viewForLayer.layer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setUpLayer() {
        l.backgroundColor = UIColor(red: 0.0, green: 62/255.0, blue: 126/255.0, alpha: 1.0).cgColor
        l.borderWidth = 10.0
        l.borderColor = UIColor(red: 0.0, green: 136/255.0, blue: 82/255.0, alpha: 1.0).cgColor
        l.shadowOpacity = 0.7
        l.shadowRadius = 10.0
        l.contents = UIImage(named: "hockeystick")?.cgImage
        l.masksToBounds = false
        l.contentsGravity = kCAGravityRight
        l.cornerRadius = 30
        

        
    }

    @IBAction func tappedGesture(_ sender: UITapGestureRecognizer) {
        l.shadowOpacity = l.shadowOpacity == 0.7 ? 0.0 : 0.7
    }

    @IBAction func pinchedGesture(_ sender: UIPinchGestureRecognizer) {
        let offset: CGFloat = sender.scale < 1 ? 5.0 : -5.0
        let oldFrame = l.frame
        let oldOrigin = oldFrame.origin
        let newOrigin = CGPoint(x: oldOrigin.x + offset, y: oldOrigin.y + offset)
        let newSize = CGSize(width: oldFrame.width + (offset * -2.0), height: oldFrame.height + (offset * -2.0))
        let newFrame = CGRect(origin: newOrigin, size: newSize)
        if newFrame.width >= 150.0 && newFrame.width <= 300.0 {
            l.borderWidth -= offset
            l.cornerRadius += (offset / 2.0)
            l.frame = newFrame
        }
    }
    @IBAction func gravitySlide(_ sender: UISlider) {
        sender.setValue(Float(lroundf(gravitySlider.value)), animated: true)
        print(sender.value)
        switch(sender.value){
        case 1: l.contentsGravity = kCAGravityCenter
        break;
        case 2: l.contentsGravity = kCAGravityTop
        break;
        case 3: l.contentsGravity = kCAGravityBottom
        break;
        case 4: l.contentsGravity = kCAGravityLeft
        break;
        case 5: l.contentsGravity = kCAGravityRight
        break;
        case 6: l.contentsGravity = kCAGravityTopLeft
        break;
        case 7: l.contentsGravity = kCAGravityTopRight
        break;
        case 8: l.contentsGravity = kCAGravityBottomLeft
        break;
        case 9: l.contentsGravity = kCAGravityBottomRight
        break;
        default: l.contentsGravity = kCAGravityRight
        break;
        }
    }
    @IBAction func borderSlide(_ sender: UISlider) {
        l.borderWidth = CGFloat(sender.value)
    }
    @IBAction func shadowSlide(_ sender: UISlider) {
        l.shadowOpacity = sender.value
    }
    @IBAction func cornerSlide(_ sender: UISlider) {
        l.cornerRadius = CGFloat(sender.value)
    }
    
    
    
    
}

