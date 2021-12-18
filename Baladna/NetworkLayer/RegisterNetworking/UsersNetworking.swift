//
//  UsersNetworking.swift
//  Baladna
//
//  Created by sharaf on 31/10/2021.
//

import Foundation
import Alamofire
enum AuthNetworking {
    //cases with function that i use in Auth Module
    case createUser(name:String,email:String,password:String,phone:String,gender:String)
}
extension AuthNetworking:TargetType{

    var baseURL: String {
        switch self {
        
        default:
            return "https://bladuna.com/api"
        }
    }
    
    var path: String {
        switch self {
       
        case .createUser:
        return "/register"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        
        case .createUser:
            return .post
        }
    }
    
    var task: Task {
        switch self {
       
        case .createUser(let name , let email , let password , let phone,let gender):
            return .requestParmters(parms: AuthParmters.registerParmtersASCustomer(name: name, email: email, phone: phone, password: password, gender: gender), encoding:JSONEncoding.prettyPrinted)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
       
    }
    
    }
}
