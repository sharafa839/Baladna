//
//  BaseApi.swift
//  Baladna
//
//  Created by sharaf on 30/10/2021.
//

import Foundation
import Alamofire

class BaseApi <T:TargetType> {
    func fetchData<M:Codable>(target:T,responseClass:M.Type,compeleteion:@escaping(Result<M?,NSError>)->Void){
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let parms = buildParms(task: target.task)
        AF.request(target.baseURL+target.path, method:method, parameters: parms.0, encoding: parms.encoding, headers: headers).responseJSON { res in
            guard let statusCode = res.response?.statusCode else {
                compeleteion(.failure(NSError()))
                return
            }
            if statusCode == 201 {
                guard  let jsonResponse = try? res.result.get() else {
                    let error = NSError(domain: target.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey:ErrorRespnse.message])
                    print("error in  code")
                    compeleteion(.failure(error))
                    return
                }
                guard  let theJsonData = try? JSONSerialization.data(withJSONObject: jsonResponse, options: .prettyPrinted) else {
                    let error = NSError(domain: target.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey:ErrorRespnse.message])
                    print("error in  jsonData")
                    compeleteion(.failure(error))
                    return
                }
                guard  let responseObject = try? JSONDecoder().decode(M.self, from: theJsonData) else {
                    let error = NSError(domain: target.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey:ErrorRespnse.message])
                    print("error in  Seriaization")
                    compeleteion(.failure(error))
                    return
                }
                compeleteion(.success(responseObject))
                
            }else{
                let message = "Erorr from BE"
                let error = NSError(domain: target.baseURL, code: statusCode, userInfo: [NSLocalizedDescriptionKey:message])
                compeleteion(.failure(error))
            }
            
        }
    }
    private func buildParms (task:Task)-> ([String:Any],encoding:ParameterEncoding){
        switch task {
        case .requestPlain:
            return ([:],URLEncoding.default)
        case .requestParmters(parms: let parms, encoding: let encoding):
        return (parms,encoding)
        }
    }
}
