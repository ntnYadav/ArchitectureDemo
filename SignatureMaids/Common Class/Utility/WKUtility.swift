//  SMUtility.swift
//  Created by Chetu on 21/12/20.
//  Copyright © 2020 Database Services. All rights reserved.


import UIKit
import AVFoundation
import MapKit
import MBProgressHUD

enum TypeOfServiceCall {
      case resgisterUser
      case loginUser
      // No service call
  }

class WKUtility: NSObject {
    /**
       This is class method used to get device ID of the device.
       - Parameters: N/A
       - Returns: String
       */
    static func getDeviceID() -> String
    {
        let deviceID = UIDevice.current.identifierForVendor!.uuidString
          print(deviceID)
        return deviceID
    }
    static  func isNetworkReachable() -> Bool {
        return SMConstant.reachabilityManager?.isReachable ?? false
    }
    /**
     This is class method used to set Localizable key value
     - Parameters:
     - key: stirng key which is declare in localization file
     - Returns: return localization string
     */
    static  func localized(key:String) ->String {
        let bundle = Bundle.main
        return bundle.localizedString(forKey: key, value: "", table: nil)
    }

    /**
     This is class method used to present the alert conroller
     - Parameters:
     title: alert title,
     message: Message which will appear on alert,
     actionTitleFirst: first button title,
     actionTitleSecond: second button title,
     firstActoin: action to be performed using first button,
     secondAction: action to be performed using second button,
     controller: in which controller alert will present
     - Returns: N/A
     */
    static func alertContoller(title: String, message: String, actionTitleFirst: String, actionTitleSecond: String, firstActoin: Selector?, secondAction: Selector?,  controller: UIViewController?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert) // 1
        guard let controller = controller else {
            return
        }
        if(!actionTitleFirst.isEmpty) {
                let firstButtonAction = UIAlertAction(title: actionTitleFirst, style: .default) { (alert: UIAlertAction!) -> Void in
                if(firstActoin != nil){
                    controller.perform(firstActoin!)
                }
            }
                alert.addAction(firstButtonAction)
        }
        if(!actionTitleSecond.isEmpty) {
            let secondAction = UIAlertAction(title: actionTitleSecond, style: .default) { (alert: UIAlertAction!) -> Void in
                if(secondAction != nil){
                    controller.perform(secondAction!)
                }
            }
            alert.addAction(secondAction)
        }
        controller.present(alert, animated: true, completion:nil)
    }
}

