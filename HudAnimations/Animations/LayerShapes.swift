//
//  LayerShapes.swift
//  HudAnimations
//
//  Created by 储诚鹏 on 2018/4/2.
//  Copyright © 2018年 储诚鹏. All rights reserved.
//

import UIKit


enum AnimationShape {
    case none
    case circle
    case circleSemi
    case stroke
    case ringThirdFour
    case rectangle
}

extension AnimationShape {
    func create(_ size: CGSize, color cl: UIColor = .white, lineWidth width: CGFloat = 2.0) -> CALayer {
        let layer = CAShapeLayer()
        let path = UIBezierPath()
        let radius = size.width / 2
        let centerPoint = CGPoint(x: radius, y: size.height / 2)
        switch self {
        case .circle:
            path.addArc(withCenter: centerPoint, radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: false)
            layer.fillColor = cl.cgColor
        case .circleSemi:
            path.addArc(withCenter: centerPoint, radius: radius, startAngle: -CGFloat.pi / 6, endAngle: -5 * CGFloat.pi / 6, clockwise: false)
            path.close()
            layer.fillColor = cl.cgColor
        case .stroke:
            path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                        radius: size.width / 2,
                        startAngle: -(.pi / 2),
                        endAngle: .pi + .pi / 2,
                        clockwise: true)
            layer.fillColor = nil
            layer.strokeColor = cl.cgColor
            layer.lineWidth = 2
        case .ringThirdFour:
            path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                        radius: size.width / 2,
                        startAngle: -3 * CGFloat.pi / 4,
                        endAngle: -CGFloat.pi / 4,
                        clockwise: false)
            layer.fillColor = nil
            layer.strokeColor = cl.cgColor
            layer.lineWidth = 2
        case .rectangle:
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: size.width, y: 0))
            path.addLine(to: CGPoint(x: size.width, y: size.height))
            path.addLine(to: CGPoint(x: 0, y: size.height))
            layer.fillColor = cl.cgColor
        default:
            break
        }
        layer.path = path.cgPath
        return layer
    }
}
