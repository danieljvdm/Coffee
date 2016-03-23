//
//  AnimationService.swift
//  Coffee
//
//  Created by Daniel on 3/23/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import UIKit

class AnimationService: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromView = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! ShopsVC
        let toView = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)! as! ShopDetailVC
        guard let indexPath = fromView.collectionView.indexPathsForSelectedItems()!.first, cell = fromView.collectionView.cellForItemAtIndexPath(indexPath) as? ShopCell else {
            return
        }
        
        let tempImage = UIImageView(frame: fromView.collectionView.convertRect(cell.frame, toView: fromView.view))
        tempImage.image = cell.backgroundImage.image
        tempImage.contentMode = .ScaleAspectFill
        tempImage.clipsToBounds = true
        
        let imageCopy = UIImageView(frame: toView.backgroundImage.frame)
        //imageCopy.center = fromView.collectionView.convertRect(cell.frame, toView: fromView.view)
        
        toView.view.alpha = 1
        
        let containerView = transitionContext.containerView()!
        containerView.addSubview(toView.view)
        let originalCenter = toView.view.center
        toView.view.transform = CGAffineTransformMakeScale(0.2, 0.2)
        toView.view.center = tempImage.center
        //containerView.addSubview(tempImage)

        UIView.animateWithDuration(self.transitionDuration(transitionContext), delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .CurveLinear, animations: {
            toView.view.center = originalCenter
            toView.view.transform = CGAffineTransformMakeScale(1, 1)
            toView.view.alpha = 1
            }) { (finished) in
                tempImage.removeFromSuperview()
                transitionContext.completeTransition(true)
        }
    }
}
