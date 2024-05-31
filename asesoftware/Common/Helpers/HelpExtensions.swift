//
//  HelpExtensions.swift
//  asesoftware
//
//  Created by Angel Rangel on 30/05/24.
//



import Foundation

import Alamofire

extension HTTPHeaders {
    static var defaultHeaders: HTTPHeader {
       
        let deviceInfoHeader = HTTPHeader(name: "accept", value: "application/json")
        
        return deviceInfoHeader
    }
}
