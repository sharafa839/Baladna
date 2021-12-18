//
//  DesignView.swift
//  tripperonline
//
//  Created by Mohamed Macbook on 4/7/20.
//  Copyright © 2020 MohamedMazin. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable class DesignView:UIView{

    
    @IBInspectable var cornerRadius:CGFloat=0
    @IBInspectable var shadowColor:UIColor?=UIColor.black
    @IBInspectable var shadowOffsetWidth:Int=0
    @IBInspectable var shadowOffsetHeight:Int=1
    @IBInspectable var shadowOpsity:Float=0.2
    
    
    
    override func layoutSubviews() {
        layer.cornerRadius=cornerRadius
        layer.shadowColor=shadowColor?.cgColor
        layer.shadowOffset=CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        let shadowPath=UIBezierPath(roundedRect: bounds, cornerRadius:  cornerRadius)
        layer.shadowPath=shadowPath.cgPath
        layer.shadowOpacity=shadowOpsity
    }
    
}
