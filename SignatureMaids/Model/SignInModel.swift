//  SignInModel.swift
//  SignatureMaids
//  Created by admin on 21/12/20.
//  Copyright © 2020 Chetu. All rights reserved.
//

import Foundation
//structure is being used to hold Log 20 minute form data
struct SignInModel {
    var userId: String
    var status : String
    var userName : String
    var latitude : String
    var longitude : String
    var address : String
    var userEmail : String
    var userPassword : String

    init(userId : String? = nil,status: String? = nil, userName: String? = nil, latitude: String? = nil, longitude: String? = nil, address: String? = nil, userEmail: String? = nil,userPassword: String? = nil) {
        self.userId       = userId ?? ""
        self.status       = status ?? ""
        self.userName     = userName ?? ""
        self.latitude     = latitude ?? ""
        self.longitude    = longitude ?? ""
        self.address      = address ?? ""
        self.userEmail    = userEmail ?? ""
        self.userPassword = userPassword ?? ""


    }
}
struct SignInData {
    var UserEmail = ""
    var UserPassWord = ""
    
}
