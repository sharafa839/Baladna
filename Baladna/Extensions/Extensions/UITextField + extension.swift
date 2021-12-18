//
//  UITextField + extension.swift
//  Zi Elengaz
//
//  Created by mahmoudhajar on 4/18/19.
//  Copyright © 2019 CreativeShare. All rights reserved.
//

import Foundation
import UIKit

private var KeyMaxLength: Int = 0

extension UITextField {
    
     func setRoundCorners(radius: CGFloat) {
        self.layer.cornerRadius = radius
         self.clipsToBounds = true
    }
    
    func drawBorder(raduis:CGFloat, borderColor:UIColor) {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 0.5
        self.setRoundCorners(raduis)
    }
    
    func placeHolderColor(color: UIColor) {
    let placeholderAttributedString = NSMutableAttributedString(attributedString: self.attributedPlaceholder!)
        placeholderAttributedString.addAttribute(.foregroundColor, value: color, range: NSRange(location: 0, length: placeholderAttributedString.length))
        self.attributedPlaceholder = placeholderAttributedString
    }
    
    func setImageToLeftView(img: UIImage) {
        let imageView = UIImageView(frame: CGRect(x: 8, y:8 , width: 16, height: 16))
          imageView.frame = CGRect(x: 16, y: 0, width: 24, height: 24)
        // rightView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: 22))
           imageView.contentMode = .scaleAspectFit
           self.leftViewMode = .always
           imageView.image = img
           self.leftView = imageView
    }
    func setImageToRightView(img: UIImage) {
           let imageView = UIImageView(frame: CGRect(x:8, y: 8, width: 16, height: 16))
               self.rightViewMode = .always
              imageView.image = img
              self.rightView = imageView
       }
  
    func setLeftPaddingPoints(_ amount:CGFloat){
          let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
          self.leftView = paddingView
          self.leftViewMode = .always
      }
      func setRightPaddingPoints(_ amount:CGFloat) {
          let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
          self.rightView = paddingView
          self.rightViewMode = .always
      }
      
     func getKeyboardLanguage() -> String? {
        return "en" // here you can choose keyboard any way you need
    }

    override open var textInputMode: UITextInputMode? {
        if let language = getKeyboardLanguage() {
            for tim in UITextInputMode.activeInputModes {
                if tim.primaryLanguage!.contains(language) {
                    return tim
                }
            }
        }
        return super.textInputMode
    }
    
    
    
    func setTextfieldInNavigation(typeSometing: String, viewController: UIViewController) {
               
               self.placeholder = typeSometing
               self.placeHolderColor(color: .lightGray)
               self.delegate = (viewController as! UITextFieldDelegate)
               self.font = UIFont.systemFont(ofSize: 20)
               self.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
               self.textAlignment = .left
               self.returnKeyType = .search 
               viewController.navigationItem.titleView = self
    }
    
    
    /// MARK : - Change placeholder color
    
//    @IBInspectable var placeHolderClor: UIColor? {
//        get {
//            return self.placeHolderClor
//        }
//        set {
//            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
//        }
//    }
    
//    func whitePlaceHolder() {
//        self.attributedPlaceholder = NSAttributedString(string: "placeholder text", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.cgColor ])
//    }
//
//
    /// MARK :- SET Padding space
    
  
    
    /// Mark: - Restrict The Number Of Characters To Type In UITextFields

    
//    @IBInspectable var maxLength: Int {
//        get {
//            if let length = objc_getAssociatedObject(self, &KeyMaxLength) as? Int {
//                return length
//            } else {
//                return Int.max
//            }
//        }
//        set {
//            objc_setAssociatedObject(self, &KeyMaxLength, newValue, .OBJC_ASSOCIATION_RETAIN)
//            addTarget(self, action: #selector(checkMaxLength), for: .editingChanged)
//        }
//    }
//    
//    @objc func checkMaxLength(textField: UITextField) {
//        guard let prospectiveText = self.text,
//            prospectiveText.count > maxLength
//            else {
//                return
//        }
//        
//        let selection = selectedTextRange
//        let maxCharIndex = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
//        text = prospectiveText.substring(to: maxCharIndex)
//        selectedTextRange = selection
//    }
//    
    
    
}
