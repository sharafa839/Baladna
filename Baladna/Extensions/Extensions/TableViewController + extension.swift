//
//  TableViewController + extension.swift
//  Direct
//
//  Created by Ghoost on 2/13/20.
//  Copyright © 2020 Khalij. All rights reserved.
//

import UIKit


extension UITableViewController {
    
    func addBackgroundImage(imgNam:String) {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let imageViewBackground = UIImageView(frame: CGRect(x:0, y:0, width: width, height: height))
        imageViewBackground.image = UIImage(named: imgNam)
        // you can change the content mode:
        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.addSubview(imageViewBackground)
        self.view.sendSubviewToBack(imageViewBackground)
    }
    
    
    
}
