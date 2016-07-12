//
//  MSAnimateTransitionManager+UIViewControllerAnimatedTransitioning.swift
//  MSAnimatedTransition
//
//  Created by MarsShen on 16/6/25.
//  Copyright © 2016年 MarsShen. All rights reserved.
//

import UIKit

extension MSInteractBubbleTransitionManager:UIViewControllerAnimatedTransitioning{
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return interactive ? 0.8 : 0.2
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView()!
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        
        let topView      = fromVC.view
        let otherView    = toVC.view
        
        let status = MSInteractBubbleTransitionStatus(context: transitionContext)
        
        let ov           = otherView.snapshotViewAfterScreenUpdates(true)
        
        containerView.addSubview(ov)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.backgroundColor = UIColor.blackColor().CGColor
        shapeLayer.fillColor = UIColor.blackColor().CGColor
        containerView.layer.addSublayer(shapeLayer)
        
        containerView.addSubview(topView)
        
        ov.alpha = 0.4
        topView.alpha = 1
        
        let x = containerView.bounds.width/2
        let y = containerView.bounds.height/2
        let doubleR = sqrt(x*x + y*y) * 2
        let circleMaskPathInitial = UIBezierPath(ovalInRect: CGRectMake(x - doubleR/2, y - doubleR/2 , doubleR, doubleR)).CGPath
        
        let fY = containerView.bounds.height + 10
        let fR = CGFloat(1)
        let fDoubleR = fR * 2
        let circleMaskPathFinal = UIBezierPath(ovalInRect: CGRectMake(x - fR , fY - fR , fDoubleR, fDoubleR)).CGPath

        shapeMaskLayer.removeAllAnimations()
        shapeMaskLayer.path = circleMaskPathInitial
        topView.layer.mask = shapeMaskLayer

        
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { _ in
            topView.alpha = 0.8
            ov.alpha = 1

        }){
            _ in
            if status.transitionWasCancelled() {
                let animation = CABasicAnimation(keyPath: "path")
                animation.toValue = circleMaskPathInitial
                animation.duration = 0.1 // duration is 0.2 sec
                animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut) // animation curve is Ease Out
                animation.fillMode = kCAFillModeBoth // keep to value after finishing
                animation.removedOnCompletion = false // don't remove after finishing
                self.shapeMaskLayer.addAnimation(animation, forKey: "cancelPath")
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
            }else{
                CATransaction.begin()
                CATransaction.setCompletionBlock(){
                    //after finish animation, run this code.
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
                }
                let finishAnimation = CABasicAnimation(keyPath: "path")
                finishAnimation.toValue = circleMaskPathFinal
                finishAnimation.duration = 0.3 // duration is 0.2 sec
                finishAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut) // animation curve is Ease Out
                finishAnimation.fillMode = kCAFillModeBoth // keep to value after finishing
                finishAnimation.removedOnCompletion = false // don't remove after finishing
                self.shapeMaskLayer.addAnimation(finishAnimation, forKey: "finishPath")
                CATransaction.commit()
            }
            
        }
    }

}
