//
//  Alert.swift
//  Iris
//
//  Created by mahmoudhajar on 2/6/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    class func alertPopUp(title: String, msg: String ,btnTitle:String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: btnTitle, style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
}
    
    class func alertError(title: String, msg: String ,btnTitle:String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: btnTitle, style: .destructive, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    class func alertErrorRestart(title: String, msg: String , vc: UIViewController) {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: General.stringForKey(key: "cancel"), style: .cancel, handler: nil)
        let settingsAction = UIAlertAction(title: General.stringForKey(key: "login"), style: .destructive) { (UIAlertAction) in
            
            HelperK.restartApp()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(settingsAction)
        vc.present(alertController, animated: true, completion: nil)
    }
    
    class func showAlertLocationPermission(vc: UIViewController){
        let alertController = UIAlertController(title: General.stringForKey(key: "locationPermissionRequired"), message: General.stringForKey(key: "locali"), preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: General
            .stringForKey(key: "settings"), style: .default, handler: {(cAlertAction) in
            //Redirect to Settings app
            UIApplication.shared.open(URL(string:UIApplication.openSettingsURLString)!)
        })
        let cancelAction = UIAlertAction(title: General.stringForKey(key: "cancel"), style: .cancel)
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        vc.present(alertController, animated: true, completion: nil)
    }
    
}
//Alert.alertErrorRestart(title: General.stringForKey(key: "error"), msg: General.stringForKey(key: "ts"), vc: self)
