//
//  UIView + extension.swift
//  Iris
//
//  Created by mahmoudhajar on 2/5/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import UIKit

enum AIEdge:Int {
    case
    Top,
    Left,
    Bottom,
    Right,
    Top_Left,
    Top_Right,
    Bottom_Left,
    Bottom_Right,
    All,
    None
}


extension UIView {
    // MRK:- Layer
    func coloringboder(color:UIColor)   {
        self.layer.borderColor = color.cgColor
        
    }
    func addActionn(vc:UIViewController,action: Selector){
        let tapGestureRecognizer = UITapGestureRecognizer(target:vc, action: action)
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    func setRoundCorners(_ radius: CGFloat) {
          self.layer.cornerRadius = radius
          self.clipsToBounds = true
      }
    
    func floatView(raduis: CGFloat) {
           self.layer.cornerRadius = raduis
           self.layer.shadowColor = UIColor.black.cgColor
           self.layer.shadowOffset = CGSize(width: 0, height: 5)
           self.layer.shadowOpacity = 0.2
           self.layer.shadowRadius = 4
       }
    
    func pinEdges(to other: UIView) {
           leadingAnchor.constraint(equalTo: other.leadingAnchor).isActive = true
           trailingAnchor.constraint(equalTo: other.trailingAnchor).isActive = true
           topAnchor.constraint(equalTo: other.topAnchor).isActive = true
           bottomAnchor.constraint(equalTo: other.bottomAnchor).isActive = true
       }
       
       func prepareView(vcView: UIView, width:CGFloat, height:CGFloat) {
           self.translatesAutoresizingMaskIntoConstraints = false
           vcView.addSubview(self)
           NSLayoutConstraint.activate([
               self.centerXAnchor.constraint(equalTo: vcView.centerXAnchor),
               self.centerYAnchor.constraint(equalTo: vcView.centerYAnchor),
               self.heightAnchor.constraint(equalToConstant: height),
               self.widthAnchor.constraint(equalToConstant: width)
           ])
       }
    
    func applyShadowWithCornerRadius(color:UIColor, opacity:Float, radius: CGFloat, edge:AIEdge, shadowSpace:CGFloat, cornerRadius:CGFloat)    {

        var sizeOffset:CGSize = CGSize.zero

        switch edge {
        case .Top:
            sizeOffset = CGSize(width: 0, height: -shadowSpace)
        case .Left:
            sizeOffset = CGSize(width: -shadowSpace, height: 0)
        case .Bottom:
            sizeOffset = CGSize(width: 0, height: shadowSpace)
        case .Right:
            sizeOffset = CGSize(width: shadowSpace, height: 0)


        case .Top_Left:
            sizeOffset = CGSize(width: -shadowSpace, height: -shadowSpace)
        case .Top_Right:
            sizeOffset = CGSize(width: shadowSpace, height: -shadowSpace)
        case .Bottom_Left:
            sizeOffset = CGSize(width: -shadowSpace, height: shadowSpace)
        case .Bottom_Right:
            sizeOffset = CGSize(width: shadowSpace, height: shadowSpace)


        case .All:
            sizeOffset = CGSize(width: 0, height: 0)
        case .None:
            sizeOffset = CGSize.zero
        }

        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true;

        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = sizeOffset
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = false

        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.layer.cornerRadius).cgPath
    }
    func roundSingleConrner(_ corners:UIRectCorner,_ cormerMask:CACornerMask, radius: CGFloat) {
              if #available(iOS 11.0, *){
                  self.clipsToBounds = false
                  self.layer.cornerRadius = radius
                  self.layer.maskedCorners = cormerMask
              }else{
                  let rectShape = CAShapeLayer()
                  rectShape.bounds = self.frame
                  rectShape.position = self.center
                  rectShape.path = UIBezierPath(roundedRect: self.bounds,    byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
                  self.layer.mask = rectShape
              }}
      
      
      func appStoreView() {
          self.layer.cornerRadius = 20.0
           self.layer.shadowColor = UIColor.gray.cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
             self.layer.shadowRadius = 12.0
              self.layer.shadowOpacity = 0.7
               self.layer.masksToBounds = false
      }
      
      func setBottomRoundedEdge(desiredCurve: CGFloat?) {
          let offset: CGFloat = self.frame.width / desiredCurve!
          let bounds: CGRect = self.bounds
          
          let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height / 2)
          let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
          let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)
          let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
          rectPath.append(ovalPath)
          
          // Create the shape layer and set its path
          let maskLayer: CAShapeLayer = CAShapeLayer()
          maskLayer.frame = bounds
          maskLayer.path = rectPath.cgPath
          
          // Set the newly created shape layer as the mask for the view's layer
          self.layer.mask = maskLayer
      }
    
    
    
  //MARK:- Animations
    func fadeIn(duration: TimeInterval = 0.5,
                  delay: TimeInterval = 1,
                  completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: .curveEaseIn,
                       animations: {
          self.alpha = 1.0
        }, completion: completion)
      }

      func fadeOut(duration: TimeInterval = 0.5,
                   delay: TimeInterval = 0.0,
                   completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: .curveEaseIn,
                       animations: {
           self.alpha = 0.0
        }, completion: completion)
      }
    
    func fadeIn1(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
           self.alpha = 0.0

           UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
               self.isHidden = false
               self.alpha = 1.0
           }, completion: completion)
       }

       func fadeOut1(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
           self.alpha = 1.0

           UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseOut, animations: {
               self.isHidden = true
               self.alpha = 0.0
           }, completion: completion)
       }
      
      func showView(objView:UIView){

          objView.alpha = 0.0
          UIView.animate(withDuration: 0.5, animations: {
              objView.alpha = 0.0
          }, completion: { (completeFadein: Bool) -> Void in
              objView.alpha = 1.0
              let transition = CATransition()
              transition.duration = 0.5
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.fade
              objView.layer.add(transition, forKey: nil)
          })
      }

      func HideView(objView:UIView){

          UIView.animate(withDuration: 0.5, animations: {
              objView.alpha = 1.0
          }, completion: { (completeFadein: Bool) -> Void in
              objView.alpha = 0.0
              let transition = CATransition()
              transition.duration = 0.5
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.fade
              objView.layer.add(transition, forKey: nil)
          })
      }
    
    func shakeF() {
               let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
               animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
               animation.duration = 0.6
               animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
               layer.add(animation, forKey: "shake")
           }
    
    // MARK:- Colors
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
          let gradientLayer = CAGradientLayer()
          gradientLayer.frame = bounds
          gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
          
        self.layer.insertSublayer(gradientLayer, at: 0)
      }
   
    
  
    
    
  
    
    
}
