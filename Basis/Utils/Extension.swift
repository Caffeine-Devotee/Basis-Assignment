//
//  Extension.swift
//  Basis
//
//  Created by GAURAV NAYAK on 06/06/20.
//  Copyright © 2020 CaffeineDevotee. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    
    var activityIndicatorTag: Int { return 999999 }
    var overLayTag : Int { return 999998 }
    
    //Add activity indicator within an overlay view to prevent user from interacting with any UIElements.
    func startActivityIndicator(style: UIActivityIndicatorView.Style = .gray, location: CGPoint? = nil) {
        print("Default value \(isActivityIndicatorVisible)")
        if( !isActivityIndicatorVisible) {
            
            isActivityIndicatorVisible = true
            
            //Set the position - defaults to `center` if no`location`
            //argument is provided
            let loc = location ?? self.view.center
            
            //Ensure the UI is updated from the main thread
            //in case this method is called from a closure
            DispatchQueue.main.async(execute: {
                
                //Create the activity indicator
                let activityIndicator = UIActivityIndicatorView(style: style)
                
                //Add the tag so we can find the view in order to remove it later
                activityIndicator.tag = self.activityIndicatorTag
                
                //Set the size
                let transform: CGAffineTransform = CGAffineTransform(scaleX: 1, y: 1)
                activityIndicator.transform = transform
                
                //Set the location
                activityIndicator.center = loc
                activityIndicator.color = UIColor.gray
                activityIndicator.hidesWhenStopped = true
                //Start animating and add the view
                
                activityIndicator.startAnimating()
                
                let overLay = UIView(frame: (UIApplication.shared.keyWindow?.frame)!)
                overLay.tag = self.overLayTag
                overLay.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
                
                overLay.addSubview(activityIndicator)
                
                UIApplication.shared.keyWindow?.addSubview(overLay)
            })
        }
    }
    
    //Stops the activity indicator and removes the overlay after a succesfull response
    func stopActivityIndicator() {
        print("Default value \(isActivityIndicatorVisible)")
        //Again, we need to ensure the UI is updated from the main thread!
        
        DispatchQueue.main.async(execute: {
            //Here we find the `UIActivityIndicatorView` and remove it from the view
            if let overLay = UIApplication.shared.keyWindow?.subviews.filter( { $0.tag == self.overLayTag}).first {
                if let activityIndicator = UIApplication.shared.keyWindow?.subviews.filter( { $0.tag == self.activityIndicatorTag}).first as? UIActivityIndicatorView
                {
                    activityIndicator.stopAnimating()
                    activityIndicator.removeFromSuperview()
                }
                overLay.isHidden = true
                overLay.removeFromSuperview()
                isActivityIndicatorVisible = false
            }
        })
    }
}

extension UICollectionView {
    
    //Scroll Collection View  back to the initial state
    func scrollToFirst() {
        self.setContentOffset(CGPoint(x: 0, y: self.contentOffset.y), animated: true)
    }
}
