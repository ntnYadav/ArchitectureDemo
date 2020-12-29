//  NetworkClass.swift
//  Created by Chetu on 18/12/20.
//  Copyright © 2020 Database Services. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class SMNetworkClass {
    let manager = Alamofire.Session.default
    init() {
        manager.session.configuration.timeoutIntervalForRequest = 600
    }
    //structure is being used to manage error model
    struct ErrorInfo {
        var errorMessage : String
        var errorType : String?
    }
    /// callService
    /// - parameter url:               url to call
    /// - parameter params:            any parameters the call needs
    /// - parameter type:              type Of service ie POST etc.
    /// - parameter completionHandler: handler triggered with json or error upon load
    
    func callCommonServiceAPI(_ url:String, params: Parameters, serviceType: SMConstant.TypeOfServiceCall, type:HTTPMethod, completionHandler:@escaping(_ xmlData: Data?, _ error: SMNetworkServiceError?, _ statusCode:Int)->Void) {
        let urlString            = url
        guard let url = URL(string: urlString) else {return}
        var request        = URLRequest(url: url)
        request.httpMethod = SMConstant.kPost
        request.setValue(SMConstant.kcontentTypeParameter, forHTTPHeaderField: SMConstant.kcontentType)
        do {
            request.httpBody   = try JSONSerialization.data(withJSONObject: params)
        } catch let error {
            print("Error : \(error.localizedDescription)")
        }
        Alamofire.Session.default.request(request).responseJSON{ (response) in
            print(response.result)
        }
    }
    
    func callAPIService(_ url:String, params: Parameters, serviceType: SMConstant.TypeOfServiceCall, type:HTTPMethod, completionHandler:@escaping(_ stringData: [String: Any]?, _ error: SMNetworkServiceError?, _ statusCode:Int)->Void)
    {
        _ = url
        var request = URLRequest(url: URL(string: url)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData , timeoutInterval: 15)
        request.setValue(SMConstant.kcontentTypeParameter, forHTTPHeaderField: SMConstant.kcontentType)
        guard let data = try? JSONSerialization.data(withJSONObject: params , options: []) else {
            return
        }
        request.httpBody = data as Data
        request.httpMethod = SMConstant.kPost
        Alamofire.Session.default.request(request).responseJSON { (response) in
            let json : JSON = JSON(response.value ?? "[]");
            guard response.error == nil else{
                let errorInfo : ErrorInfo = ErrorInfo(errorMessage: SMConstant.kSomethingWentWrong, errorType: SMConstant.kServerError)
                completionHandler(nil, SMNetworkServiceError.generic(errorInfo.errorMessage),response.response?.statusCode ?? 0)
                return
            }
            
            switch response.result {
            case .success:
               if json.rawString() != nil {
                if let dictString = self.convertToDictionary(text: json.rawString()!) {
                    completionHandler(dictString, nil,response.response?.statusCode ?? 0)
                } else {
                    let errorInfo : ErrorInfo = ErrorInfo(errorMessage: SMConstant.kSomethingWentWrong, errorType: SMConstant.kServerError)
                    completionHandler(nil, SMNetworkServiceError.generic(errorInfo.errorMessage),response.response?.statusCode ?? 0)
                }
                return
                } else {
                let errorInfo : ErrorInfo = ErrorInfo(errorMessage: SMConstant.kSomethingWentWrong, errorType: SMConstant.kServerError)
                completionHandler(nil, SMNetworkServiceError.generic(errorInfo.errorMessage),response.response?.statusCode ?? 0)
                return
            }
                
            case .failure:
                if response.response?.statusCode == 400 {
                   let errorInfo : ErrorInfo = ErrorInfo(errorMessage: SMConstant.kSomethingWentWrong, errorType: SMConstant.kServerError)
                    completionHandler(nil, SMNetworkServiceError.generic(errorInfo.errorMessage),response.response?.statusCode ?? 0)
                } else {
                    if response.data != nil{
                        debugPrint(NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue)!)
                    }
                }
            }
         }
     }
        /*
         @description : Method is being used to cancel all the requests
         Parameters: N/A
         return : N/A
         */
        func cancelAllRequest(){
            manager.session.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in
                //dataTasks.forEach { $0.cancel() }
                uploadTasks.forEach { $0.cancel() }
                //downloadTasks.forEach { $0.cancel() }
            }
        }
    }
    
    extension SMNetworkClass {
        /*
         @description : Converting json to Dictionary
         Parameters:
         text: It is type of String,
         return : Dictionary
         */
        func convertToDictionary(text: String) -> [String: Any]? {
            if let data = text.data(using: .utf8) {
                do {
                    return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                } catch {
                    print(error.localizedDescription)
                }
            }
            return nil
        }
}





