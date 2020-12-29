//  AppDelegate.swift
//  SignatureMaids-LGLA
//  Created by admin on 18/12/20.
//  Copyright © 2020 Chetu. All rights reserved.


import IQKeyboardManagerSwift
import Photos
import CoreLocation
import UserNotifications
import UIKit
import Firebase

let appDelegateData = UIApplication.shared.delegate as! AppDelegate
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate  {
    var window: UIWindow?
    var token: String = ""
    var locationManager:CLLocationManager!
    var rootVC:UIViewController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       // WKBrandingSystem.SetGlobalUIFor(tintColor: UIColor.white, foregroundColor: UIColor.white, fontSize: 17)
        FirebaseApp.configure()
        // Override point for customization after application launch.
        return true
    }
       
    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
//MARK:- Location Manager
extension AppDelegate: CLLocationManagerDelegate {
    
    func stratLocationManager()
    {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.checkUsersLocationServicesAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func checkUsersLocationServicesAuthorization(){
        /// Check if user has authorized Total Plus to use Location Services
        if CLLocationManager.locationServicesEnabled()
        {
            switch CLLocationManager.authorizationStatus()
            {
            case .notDetermined:
                // Request when-in-use authorization initially
                // This is the first and the ONLY time you will be able to ask the user for permission
                self.locationManager.delegate = self
                locationManager.requestWhenInUseAuthorization()
                break
            case .restricted, .denied:
                // Disable location features
                print("Location Access Not Available")
                break
            case .authorizedWhenInUse, .authorizedAlways:
                // Enable features that require location services here.
                print("Location Access Available")
                break
            default:
                print("************Text the User *************")
            }
        }
    }
    
    func locationManager(_ manager:CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        AppSharedData.sharedData.useraltitude = locValue.latitude as NSNumber
        AppSharedData.sharedData.userLongitude = locValue.longitude as NSNumber
        print("locations = \(locations)")
    }
}

class KeychainAccess {
    func addKeychainData(itemKey: String, itemValue: String) throws {
        guard let valueData = itemValue.data(using: .utf8) else {
            print("Keychain: Unable to store data, invalid input - key: \(itemKey), value: \(itemValue)")
            return
        }
        
        //delete old value if stored first
        do {
            try deleteKeychainData(itemKey: itemKey)
        } catch {
            print("Keychain: nothing to delete...")
        }
        
        let queryAdd: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: itemKey as AnyObject,
            kSecValueData as String: valueData as AnyObject,
            kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlocked
        ]
        let resultCode: OSStatus = SecItemAdd(queryAdd as CFDictionary, nil)
        
        if resultCode != 0 {
            print("Keychain: value not added - Error: \(resultCode)")
        } else {
            print("Keychain: value added successfully")
        }
    }
    
    func deleteKeychainData(itemKey: String) throws {
        let queryDelete: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: itemKey as AnyObject
        ]
        
        let resultCodeDelete = SecItemDelete(queryDelete as CFDictionary)
        
        if resultCodeDelete != 0 {
            print("Keychain: unable to delete from keychain: \(resultCodeDelete)")
        } else {
            print("Keychain: successfully deleted item")
        }
    }
    func queryKeychainData (itemKey: String) throws -> String? {
        let queryLoad: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: itemKey as AnyObject,
            kSecReturnData as String: kCFBooleanTrue,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        var result: AnyObject?
        let resultCodeLoad = withUnsafeMutablePointer(to: &result) {
            SecItemCopyMatching(queryLoad as CFDictionary, UnsafeMutablePointer($0))
        }
        
        if resultCodeLoad != 0 {
            print("Keychain: unable to load data - \(resultCodeLoad)")
            return nil
        }
        
        guard let resultVal = result as? NSData, let keyValue = NSString(data: resultVal as Data, encoding: String.Encoding.utf8.rawValue) as String? else {
            print("Keychain: error parsing keychain result - \(resultCodeLoad)")
            return nil
        }
        return keyValue
    }
}
