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
        let hud = CCPHud.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100), color: UIColor.red)
        view.addSubview(hud)
        hud.startAnimating()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

