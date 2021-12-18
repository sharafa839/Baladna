//
//  Router.swift
//  Baladna
//
//  Created by Ahmed on 01/11/2021.
//

import Foundation
import UIKit
class Router {
    class func NavToRegister(window:UIWindow?) {
        guard  let window = window else {
            return
        }
        let vc = ClientRegisterVC()
        window.rootViewController = vc
    }
}
