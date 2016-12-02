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
        l.backgroundColor = UIColor.blue.cgColor
        l.borderWidth = 100.0
        l.borderColor = UIColor.red.cgColor
        l.shadowOpacity = 0.7
        l.shadowRadius = 10.0
        l.contents = UIImage(named: "first")?.cgImage
        l.contentsGravity = kCAGravityCenter
    }

    @IBAction func tappedGesture(_ sender: UITapGestureRecognizer) {
    }

    @IBAction func pinchedGesture(_ sender: UIPinchGestureRecognizer) {
    }
}

