//
//  MSAnimateTransitionManager+UIViewControllerTransitioningDelegate.swift
//  MSAnimatedTransition
//
//  Created by MarsShen on 16/6/26.
//  Copyright © 2016年 MarsShen. All rights reserved.
//
import UIKit

extension MSInteractBubbleTransitionManager: UIViewControllerTransitioningDelegate {
    
    public func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        animationMode = .Presentation
        
//        return self
        return nil
    }
    
    public func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animationMode = .Dismissal
        
        return self
    }
    
    public func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        animationMode = .Presentation
//        
//        return interactive ? self : nil
        return nil
    }
    
    public func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        animationMode = .Dismissal
        
        return interactive ? self : nil
    }
}