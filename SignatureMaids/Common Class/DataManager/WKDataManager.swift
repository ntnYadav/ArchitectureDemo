//  DataManager.swift
//  Created by Chetu on 18/12/20.
//  Copyright © 2020 Database Services. All rights reserved.



import Foundation
import Foundation
class WKDataManager{
    
    static var password:String? {
          set {
              UserDefaults.standard.setValue(newValue, forKey: SMConstant.AppConstants.kUserPassword)
              UserDefaults.standard.synchronize()
          }
          get {
              return UserDefaults.standard.string(forKey: SMConstant.AppConstants.kUserPassword)
          }
      }
      //variable for holding the mediaID
      static var userFirstName:String? {
          set {
              UserDefaults.standard.setValue(newValue, forKey: SMConstant.AppConstants.kUserFirstName)
              UserDefaults.standard.synchronize()
          }
          get {
              return UserDefaults.standard.string(forKey: SMConstant.AppConstants.kUserFirstName)
          }
      }
   
      //variable for username holding the username
      static var userLastName:String? {
          set {
              UserDefaults.standard.setValue(newValue, forKey: SMConstant.AppConstants.kUserLastName)
              UserDefaults.standard.synchronize()
          }
          get {
              return UserDefaults.standard.string(forKey: SMConstant.AppConstants.kUserLastName)
          }
      }
      //variable for holding the email
     
    static var availableUser:Bool? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: SMConstant.AppConstants.kUserAvailable)
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.bool(forKey: SMConstant.AppConstants.kUserAvailable)
        }
    }
    //variable for holding the USER ID
         static var usreID:String? {
             set {
                 UserDefaults.standard.setValue(newValue, forKey: SMConstant.AppConstants.kUserID)
                 UserDefaults.standard.synchronize()
             }
             get {
                 return UserDefaults.standard.string(forKey: SMConstant.AppConstants.kUserID)
             }
         }
    //variable for holding the USER Token
    static var loginToken:String? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: SMConstant.AppConstants.kLoginToken)
            UserDefaults.standard.synchronize()
        }
        get {
            return UserDefaults.standard.string(forKey: SMConstant.AppConstants.kLoginToken)
        }
    }
    //variable for holding the user roleID
         static var usreRoleID:String? {
             set {
                 UserDefaults.standard.setValue(newValue, forKey: SMConstant.AppConstants.kUserRoleID)
                 UserDefaults.standard.synchronize()
             }
             get {
                 return "User"//UserDefaults.standard.integer(forKey: SMConstant.AppConstants.kUserRoleID)
             }
         }
    //variable for holding the menu item selected
            static var menuItem:Int? {
                set {
                    UserDefaults.standard.setValue(newValue, forKey: SMConstant.AppConstants.kMenuItem)
                    UserDefaults.standard.synchronize()
                }
                get {
                    return UserDefaults.standard.integer(forKey: SMConstant.AppConstants.kMenuItem)
                }
            }
    //variable for holding the user password.
         static var userPassword:String? {
             set {
                 UserDefaults.standard.setValue(newValue, forKey: SMConstant.AppConstants.kUserPassword)
                 UserDefaults.standard.synchronize()
             }
             get {
                 return UserDefaults.standard.string(forKey: SMConstant.AppConstants.kUserPassword)
             }
         }
    //variable for holding the Device Type
         static var userDeviceType:String? {
             set {
                 UserDefaults.standard.setValue(newValue, forKey: SMConstant.AppConstants.kUserDeviceType)
                 UserDefaults.standard.synchronize()
             }
             get {
                 return UserDefaults.standard.string(forKey: SMConstant.AppConstants.kUserDeviceType)
             }
         }
    //variable for holding the user device ID.
         static var userDeviceID:String? {
             set {
                 UserDefaults.standard.setValue(newValue, forKey: SMConstant.AppConstants.kUserDeviceID)
                 UserDefaults.standard.synchronize()
             }
             get {
                 return UserDefaults.standard.string(forKey: SMConstant.AppConstants.kUserDeviceID)
             }
         }
      //variable for holding the state of login
      static var isLogin: Bool?{
          set{
             UserDefaults.standard.setValue(newValue, forKey: SMConstant.AppConstants.kIsUserLoggedIn)
             UserDefaults.standard.synchronize()
          }
          get{
              return UserDefaults.standard.bool(forKey: SMConstant.AppConstants.kIsUserLoggedIn)
          }
      }
    
    //variable for holding the state of  *Availability
    static var  availabilityStatus: Bool?{
        set{
           UserDefaults.standard.setValue(newValue, forKey: SMConstant.AppConstants.kAvailability)
           UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.bool(forKey: SMConstant.AppConstants.kAvailability)
        }
    }
   
    //method is being used to deled all app persistant data
    static func clearAllPersistantData() {
        if let domain = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: domain)
            UserDefaults.standard.synchronize()
        }
    }
}

