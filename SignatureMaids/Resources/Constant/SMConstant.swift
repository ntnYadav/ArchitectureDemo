//  SMConstant.swift
//  Created by Chetu on 21/12/20.
//  Copyright © 2020 Database Services. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

struct SMConstant
{
    //Common constants
    static let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.apple.com")
    static let baseURL = "https://trial.hanatrial.ondemand.com/SignatureMaids/poc1/services.xsodata/";
    static let kcontentType          = "Content-Type"
    static let kcontentTypeParameter = "application/json"
    static let kauthorization        = "Authorization"
    static let kuserNameSAP          = "SignatureMaids"
    static let kPasswordSAP          = "Mkt@12345678910"
    static let kSomethingWentWrong   = "Something went wrong"
    static let kServerError          = "Server error"
    static let kCancelError          = "Cancelled"
    static let kselfMatch            = "SELF MATCHES"
    static let kPost                 = "POST"
    
    // API end Points
    static let kConLogin             = "Login"
    
    struct WKAppStagingUrl {
       static let testBaseURL = "https://SignatureMaids-lglaapi3.azurewebsites.net/"
        static var debug: Bool = true
    }
    
    //Character set constants
    struct CharacterSetForValidation {
        static let characterSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        static let emailCharacterSet = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    }
    
    struct AppConstants {
        static let kUserPassword   = "PASSWORD"
        static let kUserFirstName  = "FIRSTNAME"
        static let kUserLastName   = "LASTNAME"
        static let kUserDeviceID   = "DEVICEID"
        static let kUserID         = "USERID"
        static let kUserDeviceType = "DEVICETYPE"
        static let kUserEmail      = "EMAIL"
        static let kUserAvailable  = "USERAVAIABLE"
        static let kUserPhone      = "PHONE"
        static let kUserRoleID     = "ROLEID"
        static let kIsUserLoggedIn = "LOGGEDIN"
        static let kMenuItem       = "MENUITEM"
        static let kAvailability   = "AVAILABILITY"
        static let kLoginToken     = "TOKEN"
    }
    //cell identifiers
       struct CellIdentifiers {
           static let kLeftMenuTblViewCell   = "WKLeftMenuTableViewCell"
           static let kMsgTblViewCell        = "WKMessageViewCellNormal"
           static let kMsgTxtTblViewCell     = "WKMessageViewCellWithText"
           static let kNotiTableViewCell     = "WkNotificationTableViewCell"
           static let KReportIncidentTblCell = "WKReportIncidentVC"
           static let kReportIncidentCell    = "WkReportIncidentCell"
           static let kVehicleInspectTblCell = "WkVehicleInspectionTableViewCell"
           static let kLogsCell              = "WkLogsCell"
           static let kMessageViewCellPoll   = "WKMessageViewCellPoll"

       }
       
       //ViewController identifiers
       struct  ViewControllerIdentiFiers {
           
           static let kSignUpViewController            = "SMSignUpViewController"
           static let DashboardViewController        = "DashboardViewController"
           static let kSViewController                 = "ViewController"
           static let KChangePasswordViewController    = "WKChangePasswordViewController"

       }
       
       //Storyboard identifiers
       struct  StoryBoardIdentifiers {
           static let kStoryboardMain = "Main"
           static let kInitialNavigationVC = "InitialNavigationViewController"
           
       }
    enum TypeOfServiceCall {
        case SingUpUser
        case loginUser
    }
}
class Util {
    static func dPrint(_ text: Any?) {
        if(SMConstant.WKAppStagingUrl.debug) {
            debugPrint(text ?? "123")
        }
    }
}

