//
//  ThirdViewController.swift
//  CALayerPlayground
//
//  Created by arcui on 2016-12-02.
//  Copyright © 2016 Dyhoer. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var viewForEmitterLayer: UIView!
    
    let emitterLayer = CAEmitterLayer()
    let emitterCell = CAEmitterCell()
    
    func setUpEmitterLayer() {
        emitterLayer.frame = view.bounds
        emitterLayer.seed = UInt32(NSDate().timeIntervalSince1970)
        emitterLayer.renderMode = kCAEmitterLayerAdditive
        emitterLayer.drawsAsynchronously = true
        setEmitterPosition()
    }
    
    func setUpEmitterCell() {
        emitterCell.contents = UIImage(named: "upvote")?.cgImage
        
        emitterCell.velocity = 50.0
        emitterCell.velocityRange = 500.0
        
        emitterCell.color = UIColor.green.cgColor
        emitterCell.greenRange = 1.0
        emitterCell.alphaRange = 0.0
        emitterCell.greenSpeed = 1.0
        emitterCell.alphaSpeed = -0.5
        
        emitterCell.spin = degreesToRadians(degrees: 360.0)
        emitterCell.spinRange = degreesToRadians(degrees: 0.0)
        emitterCell.emissionRange = degreesToRadians(degrees: 360.0)
        
        emitterCell.lifetime = 2.0
        emitterCell.birthRate = 25.0
        emitterCell.xAcceleration = 500.0
        emitterCell.yAcceleration = 500.0
    }
    
    func setEmitterPosition() {
        emitterLayer.emitterPosition = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
    }
    
    func degreesToRadians(degrees: Double) -> CGFloat {
        return CGFloat(degrees * M_PI / 180.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpEmitterLayer()
        setUpEmitterCell()
        emitterLayer.emitterCells = [emitterCell]
        view.layer.addSublayer(emitterLayer)
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpEmitterCell()
        resetEmitterCells()
        setUpEmitterLayer()
        viewForEmitterLayer.layer.addSublayer(emitterLayer)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: viewForEmitterLayer) {
            emitterLayer.emitterPosition = location
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: viewForEmitterLayer) {
            emitterLayer.emitterPosition = location
        }
    }

    func resetEmitterCells() {
        emitterLayer.emitterCells = nil
        emitterLayer.emitterCells = [emitterCell]
    }
}
