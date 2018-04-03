//
//  ViewController.swift
//  HudAnimations
//
//  Created by 储诚鹏 on 2018/4/2.
//  Copyright © 2018年 储诚鹏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let hud = CCPHud(frame: CGRect(x: 100, y: 100, width: 100, height: 100), color: UIColor.red)
        view.addSubview(hud)
        hud.startAnimating()
        
        let hud1 = CCPHud(frame: CGRect(x: 200, y: 200, width: 50, height: 50), type: .ballPulse, color: UIColor.gray)
        view.addSubview(hud1)
        hud1.startAnimating()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

