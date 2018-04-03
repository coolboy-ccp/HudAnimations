//
//  BallGridPulse.swift
//  HudAnimations
//
//  Created by 储诚鹏 on 2018/4/3.
//  Copyright © 2018年 储诚鹏. All rights reserved.
//

import UIKit

class BallGridPulse: AnimationDelegate {

    func create(in layer: CALayer, size: CGSize, color: UIColor) {
        let spacing: CGFloat = 2
        let circleSize = (size.width - 2 * spacing) / 3
        let x = (layer.bounds.width - size.width) / 2
        let y = (layer.bounds.height - size.height) / 2
        let durations: [CFTimeInterval] = [0.72, 1.02, 1.28, 1.42, 1.45, 1.18, 0.87, 1.45, 1.06]
        let beginTime = CACurrentMediaTime()
        let beginTimes: [CFTimeInterval] = [ -0.06, 0.25, -0.17, 0.48, 0.31, 0.03, 0.46, 0.78, 0.45]
        let timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        
        let scale = CAKeyframeAnimation(keyPath: "transform.scale")
        scale.keyTimes = [0, 0.5, 1]
        scale.values = [1, 0.5, 1]
        scale.timingFunctions = [timingFunction, timingFunction]
        
        let opacity = CAKeyframeAnimation(keyPath: "opacity")
        opacity.keyTimes = [0, 0.5, 1]
        opacity.values = [1, 0.7, 1]
        opacity.timingFunctions = [timingFunction, timingFunction]
        
        let group = CAAnimationGroup()
        group.animations = [scale, opacity]
        group.repeatCount = HUGE
        group.isRemovedOnCompletion = false
        
        for i in 0 ..< 3 {
            for j in 0 ..< 3 {
                let circle = AnimationShape.circle.create(CGSize(width: circleSize, height: circleSize), color: color)
                let frame = CGRect(x: x + (circleSize + spacing) * CGFloat(j),
                                   y: y + (circleSize + spacing) * CGFloat(i),
                                   width: circleSize,
                                   height: circleSize)
                group.duration = durations[3 * i + j]
                group.beginTime = beginTime + beginTimes[3 * i + j]
                circle.add(group, forKey: "ballGridPulse")
                circle.frame = frame
                layer.addSublayer(circle)
            }
        }
    }
}
