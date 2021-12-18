//
//  helper.swift
//  Tadlaly
//
//  Created by mahmoudhajar on 10/21/18.
//  Copyright © 2018 MahmoudHajar. All rights reserved.
//

import UIKit

class CheckLanguage: NSObject {

    class func language () -> String
    {
        let def = UserDefaults.standard
        
        var returnLanguage = ""
        if let langs = def.object(forKey: "AppleLanguages") as? NSArray , let firstLang = langs.firstObject as? String
        {

             returnLanguage =  firstLang
        }

    return returnLanguage
}
    
    class func ChangeLanguage (NewLang : String)
    {
        let def = UserDefaults.standard
        def.set(NewLang, forKey: "keyLanguage")
        def.synchronize()

        
    }
    
    
}
