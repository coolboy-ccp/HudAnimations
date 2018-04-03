//
//  BallPulse.swift
//  HudAnimations
//
//  Created by 储诚鹏 on 2018/4/3.
//  Copyright © 2018年 储诚鹏. All rights reserved.
//

import UIKit

class BallPulse: AnimationDelegate {

    func create(in layer: CALayer, size: CGSize, color: UIColor) {
        let spacing: CGFloat = 2
        let circleSize = (size.width - spacing * 2) / 3
        let x = (layer.bounds.width - size.width) / 2
        let y = (layer.bounds.height - circleSize) / 2
        let duration: CFTimeInterval = 0.75
        let beginTime = CACurrentMediaTime()
        let beginTimes: [CFTimeInterval] = [0.12, 0.24, 0.36]
        let timingFounction = CAMediaTimingFunction(controlPoints: 0.2, 0.68, 0.18, 1.08)
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.keyTimes = [0, 0.3, 1]
        animation.timingFunctions = [timingFounction, timingFounction]
        animation.values = [1, 0.3 ,1]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        for i in 0 ..< 3 {
            let circle = AnimationShape.circle.create(CGSize(width: circleSize, height: circleSize), color: color)
            let frame = CGRect(x: x + (circleSize + spacing) * CGFloat(i),
                               y: y,
                               width: circleSize,
                               height: circleSize)
            animation.beginTime = beginTime + beginTimes[i]
            circle.frame = frame;
            circle.add(animation, forKey: "ballPulse")
            layer.addSublayer(circle)
        }
        
    }
}

