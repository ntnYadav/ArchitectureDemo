//  LogViewModel.swift
//  SignatureMaids
//  Created by admin on 21/12/2020.
//  Copyright © 2020 Chetu. All rights reserved.
//

import Foundation

import UIKit
import Alamofire
import AVKit
import Photos

open class SignInViewModel {
    public init(){}
    // MARK:- call Log Attachment Api
    /*
     @description : Method is being used send the user information and text to server .
     Parameters:
     loginParameters: hold the parameter for login,
     serviceType: Which type of service is used in network class,
     completion: completion block is being used for callback
     error: will hold the error
     return : Void
     @author:ChetuIndia
     @Date:  21 Dec 2020
     */

    func signInUserServiceCall(loginUserParameters: LoginUserParam, serviceType: TypeOfServiceCall, completion:@escaping(_ responseArray: NSArray?, _ error:SMNetworkServiceError?, _ statusCode:Int)->Void)  {
           let smNetworkClass = SMNetworkClass()
           let params : Parameters = loginUserParameters.getParams()
           smNetworkClass.callAPIService(SMConstant.WKAppStagingUrl.testBaseURL, params: params, serviceType:.loginUser, type: loginUserParameters.getMethod()) { (stringData, error,statusCode) in
               if statusCode == 200 {
                completion([] , nil,statusCode )
               } else {
                   completion(nil , error,0 )
               }
           }
        }
    
    // MARK:- Validate Entries
    /*
     @description : Method for validating the Signup Entries
     Parameters:
     data: is being used to hold signup details form data
     viewController: is being used to hold viewController from which controller we are passing data
     return : Bool
     @author:ChetuIndia
     @Date:21 Dec 2020
     */
    /*
     let storyboard = UIStoryboard.init(name: WKConstant.StoryBoardIdentifiers.kStoryboardMain, bundle: Bundle.main)
                let vc = storyboard.instantiateViewController(withIdentifier: WKConstant.ViewControllerIdentiFiers.kSecurityQuestionViewController) as? WKSecurityQuestionViewController
                vc?.controllerName = WKConstant.ViewControllerIdentiFiers.kSignUpViewController
                self.navigationController?.pushViewController(vc!, animated: true)
     **/
    func validateEntries(data: SignInData, viewController: UIViewController) -> Bool{
        
        if data.UserEmail.isEmpty {
            WKUtility.alertContoller(title: WKUtility.localized(key: "smMessage"),
                                     message: WKUtility.localized(key: "smEnterEmail"),
                                     actionTitleFirst: WKUtility.localized(key: "smOk"),
                                     actionTitleSecond: "",
                                     firstActoin: nil, secondAction: nil,
                                     controller: viewController)
            return false
        } else if !data.UserEmail.isValidEmail {
            WKUtility.alertContoller(title: WKUtility.localized(key: "smMessage"),
                                     message: WKUtility.localized(key: "kPleaseEnterValidEmail"),
                                     actionTitleFirst: WKUtility.localized(key: "smOk"),
                                     actionTitleSecond: "",
                                     firstActoin: nil, secondAction: nil,
                                     controller: viewController)
            return false
        } else  if data.UserPassWord.isEmpty {
            WKUtility.alertContoller(title: WKUtility.localized(key: "smMessage"),
                                     message: WKUtility.localized(key: "kEnterPassWord"),
                                     actionTitleFirst: WKUtility.localized(key: "smOk"),
                                     actionTitleSecond: "",
                                     firstActoin: nil, secondAction: nil,
                                     controller: viewController)
            return false
        }else if data.UserPassWord.count < 8 {
            WKUtility.alertContoller(title: WKUtility.localized(key: "smMessage"),
                                     message: WKUtility.localized(key: "kPleaseAtLeastPassword"),
                                     actionTitleFirst: WKUtility.localized(key: "smOk"),
                                     actionTitleSecond: "",
                                     firstActoin: nil, secondAction: nil,
                                     controller: viewController)
            return false
        }else {
            viewController.view.endEditing(true)
            return true
        }
    }
    
}
