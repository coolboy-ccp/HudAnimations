//
//  SquareSpin.swift
//  HudAnimations
//
//  Created by 储诚鹏 on 2018/4/3.
//  Copyright © 2018年 储诚鹏. All rights reserved.
//

import UIKit

class SquareSpin: AnimationDelegate {

    func create(in layer: CALayer, size: CGSize, color: UIColor) {
        let duration: CFTimeInterval = 3
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.09, 0.57, 0.49, 0.9)
        
        let animation = CAKeyframeAnimation(keyPath: "transform")
        animation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        animation.timingFunctions = [timingFunction, timingFunction, timingFunction, timingFunction]
        animation.values = [
            NSValue(caTransform3D: CATransform3DConcat(createRotateXTransform(angle: 0), createRotateYTransform(angle: 0))),
            NSValue(caTransform3D: CATransform3DConcat(createRotateXTransform(angle: CGFloat(Double.pi)), createRotateYTransform(angle: 0))),
            NSValue(caTransform3D: CATransform3DConcat(createRotateXTransform(angle: CGFloat(Double.pi)), createRotateYTransform(angle: CGFloat(Double.pi)))),
            NSValue(caTransform3D: CATransform3DConcat(createRotateXTransform(angle: 0), createRotateYTransform(angle: CGFloat(Double.pi)))),
            NSValue(caTransform3D: CATransform3DConcat(createRotateXTransform(angle: 0), createRotateYTransform(angle: 0))),
        ]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        let square = AnimationShape.rectangle.create(size, color: color)
        let frame = CGRect(x: (layer.bounds.width - size.width) / 2,
                           y: (layer.bounds.height - size.height) / 2,
                           width: size.width,
                           height: size.height)
        
        square.frame = frame
        square.add(animation, forKey: "animation")
        layer.addSublayer(square)
        
    }
    
    /*
     * m34 用于实现透视效果(远小近大)，默认为0
     * m34 = (-1) / D , D默认无穷大
     * D越小 透视效果越明显
     */
    private func createRotateXTransform(angle: CGFloat) -> CATransform3D {
        var transform = CATransform3DMakeRotation(angle, 1, 0, 0)
        
        transform.m34 = CGFloat(-1) / .infinity
        
        return transform
    }
    
    private func createRotateYTransform(angle: CGFloat) -> CATransform3D {
        var transform = CATransform3DMakeRotation(angle, 0, 1, 0)
        
        transform.m34 = CGFloat(-1) / 100
        
        return transform
    }
}
