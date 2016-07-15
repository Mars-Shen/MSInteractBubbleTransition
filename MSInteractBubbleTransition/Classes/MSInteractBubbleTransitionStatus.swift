//
//  MSAnimateTransitionStatus.swift
//  MSAnimatedTransition
//
//  Created by MarsShen on 16/6/26.
//  Copyright © 2016年 MarsShen. All rights reserved.
//
import UIKit

public final class MSInteractBubbleTransitionStatus {
    private let cancelled: Bool
    private let context: UIViewControllerContextTransitioning?
    
    // MARK: - Initializing a TransitionStatus Object
    
    /// Initializer for testing purpose.
    init(cancelled: Bool) {
        self.context   = nil
        self.cancelled = cancelled
    }
    
    /// Initializer for running purpose.
    init(context: UIViewControllerContextTransitioning? = nil) {
        self.context      = context
        self.cancelled = false
    }
    
    // MARK: - Reporting the Transition Progress
    
    /**
     Returns a Boolean value indicating whether the transition was canceled.
     
     true if the transition was canceled or false if it is ongoing or finished
     normally.
     
     - returns: true if the transition was canceled or NO if it is ongoing or
     finished normally.
     */
    func transitionWasCancelled() -> Bool {
        return context?.transitionWasCancelled() ?? cancelled
    }
}
