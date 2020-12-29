//  AppSharedData.swift
//  SignatureMaids
//  Created by admin on 18/12/20.
//  Copyright © 2020 admin. All rights reserved.

import Foundation
import UIKit
import CoreLocation
let appDelegate =  UIApplication.shared.delegate as! AppDelegate

class AppSharedData: NSObject , CLLocationManagerDelegate ,UIAlertViewDelegate  {
    private var locationManager = CLLocationManager()
    var userLongitude:NSNumber!
    var useraltitude:NSNumber!
    var deviceToken:String!
    var timeZoneCurrent:NSString!

    static let sharedData : AppSharedData! = {
        let instance = AppSharedData()
        return instance
    }()

    func getViewController(controllerIdentifier:String) -> Any {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyBoard.instantiateViewController(withIdentifier: controllerIdentifier)
        return controller
    }
    func timeZoneData() {
        let currentLocale = TimeZone.current.identifier
        if currentLocale == "Asia/Kolkata" {
            timeZoneCurrent = "Asia/Calcutta"
        } else {
            timeZoneCurrent = currentLocale as NSString
        }
    }
    
    func getCellForIdentifier(cellIdentifier:String, tableView:UITableView , cellOwner : Any) -> Any {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
            let nib: [Any] = Bundle.main.loadNibNamed(cellIdentifier, owner: cellOwner, options: nil)!
            cell = nib[0] as? UITableViewCell
        }
        return cell!
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func isValidAphaNumeric(testStr:String) -> Bool {
        let emailRegEx = "([A-Za-z ])+"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
  
    // locationManager
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = 1000
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        userLongitude = userLocation.coordinate.longitude as NSNumber
        useraltitude  = userLocation.coordinate.latitude as NSNumber
        if userLongitude == nil {
            determineMyCurrentLocation()
            userLongitude = 22.719
        }
        if useraltitude == nil {
            determineMyCurrentLocation()
            useraltitude = 75.8577
        }
        //print("user latitude = \(userLongitude)")
        //print("user longitude = \(useraltitude)")
        let _:CLLocationCoordinate2D = (manager.location?.coordinate)!
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }

    func checkNullValue(strKey:String, dict:[String:Any]) -> Any {
        if (dict[strKey] as? NSNull) != nil{
            print("Null key value:",strKey)
            return ""
        }
        let tempValue : Any? = dict[strKey]
        if tempValue == nil {
            return ""
        }
        return dict[strKey] as Any
    }
}


