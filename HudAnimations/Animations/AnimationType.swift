//
//  AnimationType.swift
//  HudAnimations
//
//  Created by 储诚鹏 on 2018/4/2.
//  Copyright © 2018年 储诚鹏. All rights reserved.
//

import UIKit

class NoneAnimation: AnimationDelegate {
    func create(in layer: CALayer, size: CGSize, color: UIColor) {}
}

protocol AnimationDelegate {
    func create(in layer: CALayer, size: CGSize, color: UIColor)
}

public enum CCPHudType: Int {
    case first //用于标记枚举的开始
    
    case circleStrokeSpin
    case ballPulse
    
    case last //用于标记枚举的结束
    
    static let alltypes = (first.rawValue ... last.rawValue).map{ CCPHudType(rawValue: $0) }
}


extension CCPHudType {
    func animation() -> AnimationDelegate {
        switch self {
        case .circleStrokeSpin:
            return CircleStrokeSpin()
        case .ballPulse:
            return BallPulse()
        default:
            return NoneAnimation()
        }
    }
}
