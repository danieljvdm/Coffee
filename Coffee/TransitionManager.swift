//
//  TransitionManager.swift
//  Coffee
//
//  Created by Daniel on 3/22/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import UIKit

class TransitionManager: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let toView = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)! as! ShopsDetailCVC
        let fromView = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)! as! ShopsCVC
        let test = fromView.collectionView!.indexPathsForSelectedItems()!.first!
        let cell = fromView.collectionView?.cellForItemAtIndexPath(test) as! ShopCell
        
        let imageView = UIImageView(frame: fromView.collectionView!.convertRect(cell.frame, toView: fromView.view))
        imageView.image = cell.backgroundImage.image
        imageView.contentMode = .ScaleAspectFill
        
        
       // toView.view.alpha = 0
        transitionContext.containerView()?.addSubview(imageView)
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: {
            imageView.frame = fromView.view.frame
            }) { (finished) in
                imageView.removeFromSuperview()
                //toView.view.alpha = 1
                transitionContext.completeTransition(finished)
        }
    }
}
