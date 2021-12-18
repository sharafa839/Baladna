//
//  ActivityIndicatorInsideImageManager.swift
//  Vstore
//
//  Created by imac on 3/10/20.
//  Copyright © 2020 Khalij. All rights reserved.
//

import Foundation
import UIKit

class ActivityIndicatorManager  {
    static let shared = ActivityIndicatorManager()
    
    private var containerView: UIView = {
        let view = UIView()
        view.frame = UIWindow(frame: UIScreen.main.bounds).frame
        //(forAlignmentRect: CGRect(origin: CGPoint.init(x: UIScreen.main.bounds.maxX/2, y: UIScreen.main.bounds.maxY/2), size: CGSize(width: 100, height: 100)))
        view.center = UIWindow(frame: UIScreen.main.bounds).center
        view.backgroundColor = .clear
            //UIColor(white: 0xffffff, alpha: 0.3)
        return view
    }()
    
    private var progressView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        view.center = UIWindow(frame: UIScreen.main.bounds).center
        view.backgroundColor = .gray
            //UIColor(white: 0x444444, alpha: 0.7)
       // view.backgroundColor = .clear
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        var activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 75, height: 75)
        if #available(iOS 13.0, *) {
            activityIndicator.style = .large
        } else {
            activityIndicator = UIActivityIndicatorView(style: .gray)
        }
        activityIndicator.color = #colorLiteral(red: 1, green: 0.8549019608, blue: 0.2352941176, alpha: 1)
        activityIndicator.center = CGPoint(x: progressView.bounds.width / 2, y: progressView.bounds.height / 2)
        return activityIndicator
    }()
    
    func showProgressView() {
        progressView.addSubview(activityIndicator)
        containerView.addSubview(progressView)
        UIApplication.shared.keyWindow?.addSubview(progressView)
        activityIndicator.startAnimating()
    }
    
    func hideProgressView() {
        activityIndicator.stopAnimating()
       // containerView.removeFromSuperview()
        progressView.removeFromSuperview()
    }
}
