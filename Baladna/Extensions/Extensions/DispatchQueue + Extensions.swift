//
//  DispatchQueue + Extensions.swift
//  AnaMaelum
//
//  Created by Ghoost on 4/23/20.
//  Copyright © 2020 Khalij. All rights reserved.
//

import Foundation


extension DispatchQueue {
   static func delay(_ delay: DispatchTimeInterval, closure: @escaping () -> ()) {
      DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: closure)
   }
}
