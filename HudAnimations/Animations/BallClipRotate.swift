//
//  BallClipRotate.swift
//  HudAnimations
//
//  Created by 储诚鹏 on 2018/4/3.
//  Copyright © 2018年 储诚鹏. All rights reserved.
//

import UIKit

class BallClipRotate: AnimationDelegate {

    func create(in layer: CALayer, size: CGSize, color: UIColor) {
        let duration: CFTimeInterval = 0.75
        
        let scale = CAKeyframeAnimation(keyPath: "transform.scale")
        scale.keyTimes = [0, 0.5, 1]
        scale.values = [1, 0.6, 1]
        
        let rotate = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        rotate.keyTimes = [0, 0.5, 1]
        rotate.values = [0, CGFloat.pi, CGFloat.pi * 2]
        
        let group = CAAnimationGroup()
        group.animations = [scale, rotate]
        group.timingFunction = CAMediaTimingFunction(name: "linear")
        group.duration = duration
        group.repeatCount = HUGE
        group.isRemovedOnCompletion = false
        
        let circle = AnimationShape.ringThirdFour.create(size, color: color)
        let frame = CGRect(x: (layer.bounds.width - size.width) / 2,
                           y: (layer.bounds.height - size.height) / 2,
                           width: size.width,
                           height: size.height)
        
        circle.frame = frame
        circle.add(group, forKey: "ballClipRotate")
        layer.addSublayer(circle)
    }
}
