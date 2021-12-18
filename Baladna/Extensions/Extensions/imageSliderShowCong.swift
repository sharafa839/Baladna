//
//  imageSliderShowCong.swift
//  Bazelt
//
//  Created by Ghoost on 3/31/20.
//  Copyright © 2020 Khalij. All rights reserved.
//

import Foundation
import UIKit
import ImageSlideshow

extension ImageSlideshow {
    
     func configSliderShow() {
          //self.sliderShow.floatView(raduis: 20.0)
          self.slideshowInterval = 0.1
          self.pageIndicatorPosition = .init(horizontal: .center, vertical: .bottom)
          self.contentScaleMode = UIView.ContentMode.scaleToFill
          let pageControl = UIPageControl()
          pageControl.currentPageIndicatorTintColor = UIColor.black
          pageControl.pageIndicatorTintColor = UIColor.white
          self.pageIndicator = pageControl
          self.activityIndicator = DefaultActivityIndicator()
          self.activityIndicator = DefaultActivityIndicator(style: .gray , color: nil )
          self.addSubview(pageControl)
      }
    
}

