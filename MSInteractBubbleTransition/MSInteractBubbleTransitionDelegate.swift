//
//  MSAnimateTransition.swift
//  MSAnimatedTransition
//
//  Created by MarsShen on 16/6/22.
//  Copyright © 2016年 MarsShen. All rights reserved.
//

import UIKit

protocol MSInteractBubbleTransitionDelegate{
    func MSInteractBubbleTransitionNeedDismiss(vMSInteractBubbleTransitionManager: MSInteractBubbleTransitionManager)
}


extension MSInteractBubbleTransitionDelegate {
    func MSInteractBubbleTransitionNeedDismiss(vMSInteractBubbleTransitionManager: MSInteractBubbleTransitionManager){}
}