//
//  CCPHud.swift
//  HudAnimations
//
//  Created by 储诚鹏 on 2018/4/2.
//  Copyright © 2018年 储诚鹏. All rights reserved.
//

import UIKit

public struct CCPDefauts {
    public static let type: CCPHudType = .circleStrokeSpin
    public static let color: UIColor = .white
    public static let text_color: UIColor = .white
    public static let padding: CGFloat = 0
    public static let block_size = CGSize(width: 60, height: 60)
    public static let block_display_time_threshold = 0
    public static let block_min_display_time = 0
    public static let message = ""
    public static let message_spacing: CGFloat = 8.0
    public static let message_font = UIFont.boldSystemFont(ofSize: 20)
    public static let block_background_color = UIColor(white: 0, alpha: 0.5)
}


public final class CCPHud: UIView {
    public var type = CCPDefauts.type
    @IBInspectable public var color = CCPDefauts.color
    @IBInspectable public var padding = CCPDefauts.padding
    private(set) public var isAnimating: Bool = false
    
    public init(frame: CGRect, type: CCPHudType = CCPDefauts.type, color: UIColor = CCPDefauts.color, padding: CGFloat = CCPDefauts.padding) {
        self.type = type
        self.color = color
        self.padding = padding
        super.init(frame: frame)
        isHidden = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.clear
        isHidden = true
    }
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: bounds.width, height: bounds.height)
    }
    
    public override var bounds: CGRect {
        didSet {
            if oldValue != bounds && isAnimating {
                animationSet()
            }
        }
    }
    
    public final func startAnimating() {
        isHidden = false
        isAnimating = true
        layer.speed = 1
        animationSet()
    }
    
    private final func  animationSet() {
        guard let animation = type.animation() else {
            return
        }
        var animationRect = UIEdgeInsetsInsetRect(frame, UIEdgeInsetsMake(padding, padding, padding, padding))
        let minEdg = min(animationRect.width, animationRect.height)
        layer.sublayers = nil
        animationRect.size = CGSize(width: minEdg, height: minEdg)
        animation.create(in: layer, size: animationRect.size, color: color)
        
    }
}
