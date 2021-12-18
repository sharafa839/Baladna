//
//  LottieHelper.swift
//  MvvmRxSwiftProOne
//
//  Created by Ghoost on 9/14/20.
//  Copyright © 2020 Khalij. All rights reserved.
//

import UIKit
import Lottie


class LottieHelper: NSObject {

    
    private override init() {}

    static let shared = LottieHelper()

    let animationView = AnimationView()
    
    func startAnimation(view: UIView,name:String) {
        animationView.animation = Animation.named(name)
        animationView.frame = CGRect(x: 0, y: 0, width: 200 , height: 200)
        animationView.center = view.center
        animationView.layer.cornerRadius = 10
        animationView.contentMode = .scaleAspectFit
        animationView.backgroundColor = .clear
        animationView.loopMode = .loop
        animationView.play()
        view.addSubview(animationView)
    }
 
     func hideAnimation(){
        animationView.stop()
        animationView.removeFromSuperview()
    }
    
    
    
    
}

