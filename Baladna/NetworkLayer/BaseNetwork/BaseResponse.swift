//
//  BaseResponse.swift
//  Baladna
//
//  Created by sharaf on 17/12/2021.
//

import Foundation
struct BaseResponse<T:Codable>:Codable {
    var status:Bool?
    var data:T?
    
    enum CodingKeys:String,CodingKey {
        case status = "status"
        case data = "data"
    }
}
