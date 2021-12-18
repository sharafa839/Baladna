//
//  NaviagtionController + extensions.swift
//  Zi Elengaz
//
//  Created by mahmoudhajar on 4/18/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import Foundation
import UIKit
import AVKit
extension UIViewController {
    func hideNavigationShadow() {
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
    }
    
    func hideNavigationBar(){
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    func showNavigationBar() {
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
     func setTranslucentForNavigation() {
         let navigationBar = self.navigationController?.navigationBar
         navigationBar?.setBackgroundImage(UIImage(), for: .default)
         navigationBar?.shadowImage = UIImage()
         navigationBar?.isTranslucent = true
       }
    
    
    func setImageForNavigation (img: UIImage) { self.navigationController?.navigationBar.setBackgroundImage(img.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch), for: .default)
    }
    
}
extension UIImageView {
    func downlodImage(str:String){
        guard let url = URL(string: str) else {return}
print(url)
    DispatchQueue.global().async {
        let data = try? Data(contentsOf: url)
        print(data)//make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        DispatchQueue.main.async {
            return  self.image = UIImage(data: data ?? Data())
        }
    }
    }
}
