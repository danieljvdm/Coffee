//
//  AnimationService.swift
//  Coffee
//
//  Created by Daniel on 3/23/16.
//  Copyright © 2016 danieljvdm. All rights reserved.
//

import UIKit

class AnimationService: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! ShopsVC
        let toView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)! as! ShopDetailVC
        guard let indexPath = fromView.collectionView.indexPathsForSelectedItems!.first, let cell = fromView.collectionView.cellForItem(at: indexPath) as? ShopCell else {
            return
        }
        
        let tempImage = UIImageView(frame: fromView.collectionView.convert(cell.frame, to: fromView.view))
        tempImage.image = cell.backgroundImage.image
        tempImage.contentMode = .scaleAspectFill
        tempImage.clipsToBounds = true
        
        //imageCopy.center = fromView.collectionView.convertRect(cell.frame, toView: fromView.view)
        
        toView.view.alpha = 1
        
        let containerView = transitionContext.containerView
        containerView.addSubview(toView.view)
        let originalCenter = toView.view.center
        toView.view.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        toView.view.center = tempImage.center
        //containerView.addSubview(tempImage)

        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .curveLinear, animations: {
            toView.view.center = originalCenter
            toView.view.transform = CGAffineTransform(scaleX: 1, y: 1)
            toView.view.alpha = 1
            }) { (finished) in
                tempImage.removeFromSuperview()
                transitionContext.completeTransition(true)
        }
    }
}
