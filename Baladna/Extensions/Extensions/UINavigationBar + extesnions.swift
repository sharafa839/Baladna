//
//  UINavigationBar + extesnions.swift
//  IHelpYou
//
//  Created by Ghoost on 9/14/19.
//  Copyright © 2019 Khalij. All rights reserved.
//

import UIKit


extension UINavigationBar {
    func transparentNavigationBar(navBar: UINavigationBar, alpha: CGFloat) {
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        //navBar.isTranslucent = true
        navBar.alpha = alpha
    }
}
