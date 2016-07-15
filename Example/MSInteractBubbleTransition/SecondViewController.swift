//
//  ViewController.swift
//  MSAnimatedTransition
//
//  Created by MarsShen on 16/6/22.
//  Copyright © 2016年 MarsShen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController{
    let DismissSegueName = "DismissSegue"
    
    var perViewController:UIViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.redColor()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }    

}

