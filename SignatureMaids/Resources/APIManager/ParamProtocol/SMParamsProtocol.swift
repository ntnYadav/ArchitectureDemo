//  ParamsProtocol.swift
//  WatchMyBack
//  Created by Chetu on 21/12/20.
//  Copyright © 2020 Database Services. All rights reserved.
//

import Foundation
import Alamofire

//Protocol is being used to get parameters and method type in network calls
protocol SMParamsProtocol {
    mutating func getParams() -> Parameters;
    func getMethod() -> HTTPMethod;
}


