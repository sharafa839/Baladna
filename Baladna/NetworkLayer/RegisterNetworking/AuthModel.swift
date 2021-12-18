//
//  AuthModel.swift
//  Baladna
//
//  Created by sharaf on 31/10/2021.
//

import Foundation

// MARK: - Register
struct Register: Codable {
    var payload: RegisterPayload?
    var status: Bool?
    var code: Int?
    var messages: String?
}

// MARK: - Payload
struct RegisterPayload: Codable {
    var userInfo: RegisterUserInfo?
    var tokenType, token, tokenExpiresAt: String?

    enum CodingKeys: String, CodingKey {
        case userInfo = "user_info"
        case tokenType = "token_type"
        case token
        case tokenExpiresAt = "token_expires_at"
    }
}

// MARK: - UserInfo
struct RegisterUserInfo: Codable {
    var fullName, email, phone, type: String?
    var gender, status, id, updatedAt: String?
    var createdAt: String?
    var logo: String?
    var service: [String]?
    var workField, emirate, city: String?

    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case email, phone, type, gender, status, id
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case logo, service
        case workField = "work_field"
        case emirate, city
    }
}
extension RegisterUserInfo {
    var fullnameEmail: String{
        return "\(String(describing: fullName))" + "\(String(describing: email))"
    }
}
