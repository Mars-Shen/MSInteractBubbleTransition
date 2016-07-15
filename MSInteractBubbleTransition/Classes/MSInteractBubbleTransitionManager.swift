//
//  MSAnimateTransitionManager.swift
//  MSAnimatedTransition
//
//  Created by MarsShen on 16/6/25.
//  Copyright © 2016年 MarsShen. All rights reserved.
//

import UIKit


public final class MSInteractBubbleTransitionManager : UIPercentDrivenInteractiveTransition{
    public var delegate: MSInteractBubbleTransitionDelegate?
    /// Defines the animation mode of the transition.
    enum AnimationMode {
        /// Present the menu mode.
        case Presentation
        /// Dismiss the menu mode.
        case Dismissal
    }
    /// The current animation mode.
    var animationMode = AnimationMode.Dismissal
    /// Flag to know when whether the transition is interactive.
    var interactive = false
    
    /// Mask to used to create the bubble effect.
    let shapeMaskLayer = CAShapeLayer()
    
    public func setPanToDismissGesture(view:UIView){
        let panGesture = UIPanGestureRecognizer()
        panGesture.maximumNumberOfTouches = 1
        panGesture.addTarget(self, action:#selector(MSInteractBubbleTransitionManager.panned(_:)))
        
        view.addGestureRecognizer(panGesture)
    }
    func panned(gestureRecognizer: UIPanGestureRecognizer) {
        let view        = gestureRecognizer.view!
        let translation = gestureRecognizer.translationInView(view)
        
        let percentage = min(max(translation.y / (2 * view.bounds.height / 5), 0), 1)
        let location  = gestureRecognizer.locationInView(view)
        let percentageHeight = min(max(location.y / view.bounds.height, 0), 1)
        
        switch gestureRecognizer.state {
        case .Began:
            interactive = true
            
            delegate?.MSInteractBubbleTransitionNeedDismiss(self)
        case .Changed:
            let r = view.bounds.height * (1 - pow(percentageHeight , (2/5)))
            
            let offsetY = view.bounds.height - location.y
            let rectLen = r * 2
            if percentageHeight > 0.5 {
                shapeMaskLayer.path = UIBezierPath(ovalInRect: CGRectMake(location.x - r, location.y - r , rectLen, rectLen)).CGPath
            }else{
                shapeMaskLayer.path = UIBezierPath(ovalInRect: CGRectMake(location.x - r, offsetY - r, rectLen, rectLen)).CGPath
            }            
            
            updateInteractiveTransition(percentage)
        default:
            interactive = false
            if percentage > 0.5 {
                finishInteractiveTransition()
            }
            else {
                cancelInteractiveTransition()
            }
        }
    }
    
    
}

