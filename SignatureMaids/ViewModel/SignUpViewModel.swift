//
//  SignUpViewModel.swift
//  SignatureMaids
//
//  Created by admin on 23/12/2020.
//  Copyright © 2020 Chetu. All rights reserved.
//

import UIKit
import Alamofire

open class SignUpViewModel {
    
    public init(){}

    // MARK:- call Signup Attachment Api
       /*
        @description : Method is being used send the user information and text to server .
        Parameters:
        loginParameters: hold the parameter for sign up,
        serviceType: Which type of service is used in network class,
        completion: completion block is being used for callback
        error: will hold the error
        return : Void
        @author:ChetuIndia
        @Date: 23 Dec 2020
        */

       func signUpUserServiceCall(loginUserParameters: SignUpUserParams, serviceType: TypeOfServiceCall, completion:@escaping(_ responseArray: NSArray?, _ error:SMNetworkServiceError?, _ statusCode:Int)->Void)  {
              let smNetworkClass = SMNetworkClass()
              let params : Parameters = loginUserParameters.getParams()
              smNetworkClass.callAPIService(SMConstant.WKAppStagingUrl.testBaseURL, params: params, serviceType:.SingUpUser, type: loginUserParameters.getMethod()) { (stringData, error,statusCode) in
                  if statusCode == 200 {
                   completion([] , nil,statusCode )
                  } else {
                      completion(nil , error,0 )
                  }
              }
           }
       
}
