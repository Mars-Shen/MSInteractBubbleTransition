//
//  MainViewController.swift
//  MSAnimatedTransition
//
//  Created by MarsShen on 16/6/26.
//  Copyright © 2016年 MarsShen. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,MSInteractBubbleTransitionDelegate {
    let PresentSegueName = "PresentSegue"
    let DismissSegueName = "DismissSegue"
    var secoundViewController:UIViewController?
    
    @IBOutlet var manager: MSInteractBubbleTransitionManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func unwindToMainViewController(sender: UIStoryboardSegue) {
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == PresentSegueName {
            let vc = segue.destinationViewController
            secoundViewController = vc
            manager.setPanToDismissGesture(vc.view)
            
            vc.transitioningDelegate = manager
        }
    }
 
    func MSInteractBubbleTransitionNeedDismiss(vMSInteractBubbleTransitionManager: MSInteractBubbleTransitionManager){
        secoundViewController?.performSegueWithIdentifier(DismissSegueName, sender: self)
    }

}
