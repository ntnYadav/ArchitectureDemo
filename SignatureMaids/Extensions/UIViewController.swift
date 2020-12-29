//
//  UIViewController.swift
//  SignatureMaids
//
//  Created by admin on 21/12/20.
//  Copyright © 2020 Chetu. All rights reserved.
//


import UIKit
import MBProgressHUD

extension UIViewController {
    
    /// Show the MBProgress hud
    /// - Parameter progressLabel: String that to show in label
    func showHUD(progressLabel:String){
        DispatchQueue.main.async{
            let progressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
            progressHUD.contentColor = PrimaryColor.navySeptaBlue(alphaValue: 1.0)
            progressHUD.label.text = progressLabel
        }
    }
    func showHUD1(progressLabel:String,isAnimation:Bool){
        DispatchQueue.main.async{
            let progressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
            progressHUD.contentColor = PrimaryColor.navySeptaBlue(alphaValue: 1.0)
            progressHUD.label.text = progressLabel
            let currentWindow: UIWindow? = UIApplication.shared.keyWindow
            if isAnimation == true {
                currentWindow?.addSubview(progressHUD)
            } else {
                currentWindow?.willRemoveSubview(progressHUD)
                 MBProgressHUD.hide(for: self.view, animated: isAnimation)
            }
           
        }
    }
    /// Hide the MBProgress hud
    /// - Parameter isAnimated: Animation true of false value
    func dismissHUD(isAnimated:Bool) {
        DispatchQueue.main.async{
           let currentWindow: UIWindow? = UIApplication.shared.keyWindow
            currentWindow?.removeFromSuperview()
            MBProgressHUD.hide(for: self.view, animated: isAnimated)
        }
    }
    
   //  SHOW - self.showHUD(progressLabel: "Loading...")

    // HIDE - self.dismissHUD(isAnimated: true)
}
