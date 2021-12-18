//
//  Str + Extension.swift
//  Vstore
//
//  Created by Ghoost on 12/31/19.
//  Copyright © 2019 Khalij. All rights reserved.
//

import Foundation


extension String {
    var urlFromString: String {
          return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    }
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    var replacedArabicDigitsWithEnglish: String {
        var str = self
        let map = ["٠": "0",
                   "١": "1",
                   "٢": "2",
                   "٣": "3",
                   "٤": "4",
                   "٥": "5",
                   "٦": "6",
                   "٧": "7",
                   "٨": "8",
                   "٩": "9"]
        map.forEach { str = str.replacingOccurrences(of: $0, with: $1) }
        return str
    }
    
    var replacedWhitespaceWithUnderscore: String {
        return self.replacingOccurrences(of: " ", with: "_")
    }
    var html2AttributedString: NSAttributedString? {
              return Data(utf8).html2AttributedString
        }
    var html2String: String {
              return html2AttributedString?.string ?? ""
        }
    
    var isValidEmail: Bool {
         let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
         let testEmail = NSPredicate(format:"SELF MATCHES %@", regularExpressionForEmail)
         return testEmail.evaluate(with: self)
      }
      var isValidPhone: Bool {
         let regularExpressionForPhone = "^\\d{3}-\\d{3}-\\d{4}$"
         let testPhone = NSPredicate(format:"SELF MATCHES %@", regularExpressionForPhone)
         return testPhone.evaluate(with: self)
      }
    
}
extension Data {
var html2AttributedString: NSAttributedString? {
    do {
        return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
    } catch {
        print("error:", error)
        return  nil
    }}}
