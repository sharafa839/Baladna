//
//  CardView.swift
//  Iris
//
//  Created by mahmoudhajar on 4/16/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import UIKit

@IBDesignable
class CardView: UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.shadowRadius = newValue
            layer.masksToBounds = false
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
            layer.shadowColor = UIColor.darkGray.cgColor
        }
    }
    
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
            layer.shadowColor = UIColor.gray.cgColor
            layer.masksToBounds = false
        }
    }
    
//    @IBInspectable var shadowRaduis: CGFloat {
//        get {
//           return layer.shadowRadius
//        }
//        set {
//            layer.shadowRadius = newValue
//
//        }
//    }
}
