//
//  ServiceParams.swift
//  Created by Chetu on 18/12/20.
//  Copyright © 2020 Database Services. All rights reserved.
//

import Foundation
import Alamofire

// UserRegisterParams - information needed to get back a single trip ticket
struct SignUpUserParams : SMParamsProtocol
{
    //var UserID : Int;
    var UserFirstName : String;
    var UserLastName : String;
    var UserPhone : String;
    var UserEmail : String;
    var UserPassWord : String;
    var UserDeviceId :String;
    var UserDeviceType :String;
    var UserActive : String;
    var UserRoleId:String;
    var Longitude : String;
    var Latitude : String;
    
    /*
     @description : Method is being used to get parameters for getJobListFromServer service
     Parameters:NA
     return : Parameters
     */
    
    func getParams() -> Parameters {
        return [ "FirstName":UserFirstName,
                 "LastName": UserLastName,
                 "PhoneNumber":UserPhone,
                 "Email":UserEmail,
                 "Password": UserPassWord,
                 "DeviceId":UserDeviceId,
                 "DeviceType":UserDeviceType,
                 "Role":UserRoleId,
                 "Longitude": Longitude,
                 "Latitude": Latitude,
        ] 
    }
    
    /*
     @description : Method is being used to get service call type
     Parameters:NA
     return : HTTPMethod
     */
    func getMethod() -> HTTPMethod {
        return .post;
    }
}
struct LoginUserParam:SMParamsProtocol{
    var UserEmail: String;
    var UserPassWord: String;
    var DeviceId: String;

    /*
     @description : Method is being used to get parameters for Contact of particular user service
     Parameters:NA
     return : Parameters
     */
    func getParams() -> Parameters {
        return [ "UserName":UserEmail,
                 "Password": UserPassWord,
                 "DeviceId": DeviceId,
        ];
    }
    
    /*
     @description : Method is being used to get service call type
     Parameters:NA
     return : HTTPMethod
     */
    func getMethod() -> HTTPMethod {
        return .get;
    }
}




