//
//  helper.swift
//  Tadlaly
//
//  Created by mahmoudhajar on 10/21/18.
//  Copyright © 2018 MahmoudHajar. All rights reserved.
//

import UIKit

public class General: NSObject {

    
   class func stringForKey(key : String) -> String

    {
        
        var currentMainBundle :Bundle
        switch (UserDefaults.standard.string(forKey: "keyLanguage"))
        {
            
        case "ar"?:
            let path = Bundle.main.path(forResource: "ar", ofType: "lproj")
            
            currentMainBundle = Bundle(path: path!)!
            
            return currentMainBundle.localizedString(forKey: key, value:"key not found" , table: nil)
            
        case "en"?:
            
            
            let path = Bundle.main.path(forResource: "en", ofType: "lproj")
            
            currentMainBundle = Bundle(path: path!)!
            
            return  currentMainBundle.localizedString(forKey: key, value:"key not found" , table: nil)
            
            
        default:
            let path = Bundle.main.path(forResource: "ar", ofType: "lproj")
            
            currentMainBundle = Bundle(path: path!)!
            
            currentMainBundle.localizedString(forKey: key, value:"key not found" , table: nil)
            
            return   currentMainBundle.localizedString(forKey: key, value:"key not found" , table: nil)
        }
        
        
    }

  class  func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
    
   
    
 class func CurrentDeviceLanguage() -> String {
    
    let returnL : String = UserDefaults.standard.object(forKey: "DeviceLanguage") as! String
    
    if returnL.range(of:"en") != nil {
        return "en"
    }else
        if returnL.range(of:"ar") != nil {
            return "ar"
        }else
                {
                    return "ar"
    }
    
    }
    
    
    class func changeDeviceLanguage(Lan:String){
        UserDefaults.standard.set([Lan], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }
    class func CurrentLanguage() -> String {
        let returnL : String = UserDefaults.standard.object(forKey: "keyLanguage") as! String
        
        
              //  print(returnL)
        if returnL.range(of:"en") != nil {
            return "en"
        }else
            if returnL.range(of:"ar") != nil {
                return "ar"
            }else{
                return "ar"
        
        }
    }
    
    
    class func changeLanguage(vc:UIViewController) {
     let actionSheet = UIAlertController(title: General.stringForKey(key: "changeLanguage"), message: "", preferredStyle: .actionSheet)
     actionSheet.addAction(UIAlertAction(title: General.stringForKey(key: "arabic"), style: .default, handler: { (action) in
         if General.CurrentLanguage() == "ar" {
             CheckLanguage.ChangeLanguage(NewLang: "en")
         } else {
             CheckLanguage.ChangeLanguage(NewLang: "ar")
         }
         HelperK.restartApp()
         actionSheet.dismiss(animated: true, completion: nil)
      }))
    actionSheet.addAction(UIAlertAction(title: General.stringForKey(key: "cancel"), style: .cancel , handler: nil))
    if UIDevice.current.userInterfaceIdiom == .pad{
         if let currentPopoverpresentioncontroller = actionSheet.popoverPresentationController{
             currentPopoverpresentioncontroller.permittedArrowDirections = []
             currentPopoverpresentioncontroller.sourceRect = CGRect(x: (vc.view.bounds.midX), y: (vc.view.bounds.midY), width: 0, height: 0)
             currentPopoverpresentioncontroller.sourceView = vc.view
             vc.present(actionSheet, animated: true, completion: nil)
         }}else{
         vc.present(actionSheet, animated: true, completion: nil)
     }}
    
}
