//
//  CircleStrokeSpin.swift
//  HudAnimations
//
//  Created by 储诚鹏 on 2018/4/2.
//  Copyright © 2018年 储诚鹏. All rights reserved.
//

import UIKit

final class CircleStrokeSpin:  AnimationDelegate{

    func create(in layer: CALayer, size: CGSize, color: UIColor) {
        let beginTimer: CFTimeInterval = 0.5
        let strokeStartTimer: CFTimeInterval = 1.2
        let strokeEndDuration: CFTimeInterval = 0.7
        
        let rotation = CABasicAnimation.init(keyPath: "transform.rotation")
        rotation.byValue = Float.pi * 2
        rotation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
        
        let strokeEnd = CABasicAnimation.init(keyPath: "strokeEnd")
        strokeEnd.duration = strokeEndDuration
        strokeEnd.timingFunction = CAMediaTimingFunction.init(controlPoints: 0.4, 0.0, 0.2, 1.0)
        strokeEnd.fromValue = 0
        strokeEnd.toValue = 1
        
        let strokeStart = CABasicAnimation.init(keyPath: "strokeStart")
        strokeStart.duration = strokeStartTimer
        strokeStart.fromValue = 0
        strokeStart.toValue = 1.0
        strokeStart.beginTime = beginTimer
        strokeStart.timingFunction = CAMediaTimingFunction.init(controlPoints: 0.4, 0.0, 0.2, 1.0)
        
        let group = CAAnimationGroup()
        group.animations = [rotation, strokeStart, strokeEnd]
        group.duration = strokeStartTimer + beginTimer
        group.repeatCount = .infinity
        group.isRemovedOnCompletion = false
        group.fillMode = kCAFillModeForwards
        
        let circle = AnimationShape.stroke.create(size, color: color)
        let frame = CGRect(
            x: (layer.bounds.width - size.width) / 2,
            y: (layer.bounds.height - size.height) / 2,
            width: size.width,
            height: size.height
        )
        circle.frame = frame
        circle.add(group, forKey: "circleStrokeSpin")
        layer.addSublayer(circle)
    }
}
