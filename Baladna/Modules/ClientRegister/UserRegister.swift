//
//  UserLogin.swift
//  
//
//  Created by sharaf on 01/12/2021.
//

import Foundation

class RegisterViewModel {
    let user : RegisterProtocol = AuthApi()

    func registerAsCustomer(name:String,phone:String,password:String,email:String,Gender:String){
        user.register(name: name, email: email, password: password, phone: phone, gender: Gender, compeletion: { (res) in
            switch res{
            case.success(let register):
                
                guard let user =  register else{return}
                        if user.status == true {
                            print(user.payload?.userInfo?.fullnameEmail)
                        
                    }
                
            case.failure(let error):
                print(error.code)
            }
          
        })
    }
    
}
