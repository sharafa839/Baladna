//
//  AuthParmters.swift
//  Baladna
//
//  Created by sharaf on 31/10/2021.
//

import Foundation
import Alamofire
class AuthParmters {
    class func registerParmtersASCustomer(name:String,email:String,phone:String,password:String,gender:String)->Parameters {
        let parms = ["full_name":name,"email":email,"phone":phone,"password":password,"gender":gender,"type":"customer"] as [String:Any]
        return parms
    }
}
