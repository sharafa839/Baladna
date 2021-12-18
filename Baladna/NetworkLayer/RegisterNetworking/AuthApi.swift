//
//  AuthApi.swift
//  Baladna
//
//  Created by sharaf on 31/10/2021.
//

import Foundation
protocol RegisterProtocol {
    func register(name: String, email: String, password: String, phone: String, gender: String,compeletion : @escaping(Result<BaseResponse<Register>?,NSError>)->Void)
}

class AuthApi:BaseApi<AuthNetworking>,RegisterProtocol {
    func register(name: String, email: String, password: String, phone: String, gender: String, compeletion: @escaping(Result<BaseResponse<Register>?,NSError>) -> Void) {
        self.fetchData(target: .createUser(name: name, email: email, password: password, phone: phone, gender: gender), responseClass: BaseResponse<Register>.self, compeleteion: compeletion)
    }
    
   
}
