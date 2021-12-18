//
//  TableView + Extesnions.swift
//  Dalali_Jamalek(Admin)
//
//  Created by Ghoost on 6/5/19.
//  Copyright © 2019 Mahmoud_abdlAziz. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerNib<Cell:UITableViewCell>(cell:Cell.Type) {
        let nibName = String(describing: Cell.self)
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    
    func dequeue<Cell:UITableViewCell>() -> Cell {
        let identifier = String(describing: Cell.self)
        guard let cell =  self.dequeueReusableCell(withIdentifier: identifier) as? Cell else { fatalError(" Error in cell") }
        return cell
    }
    
    
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }
    
     func setEmptyView(title: String, message: String, messageImage: UIImage) {
           
           let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
           
           let messageImageView = UIImageView()
           let titleLabel = UILabel()
           let messageLabel = UILabel()
           
           messageImageView.backgroundColor = .clear
           
           titleLabel.translatesAutoresizingMaskIntoConstraints = false
           messageImageView.translatesAutoresizingMaskIntoConstraints = false
           messageLabel.translatesAutoresizingMaskIntoConstraints = false
           
           titleLabel.textColor = UIColor.black
           titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
           
           messageLabel.textColor = UIColor.lightGray
           messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
           
           emptyView.addSubview(titleLabel)
           emptyView.addSubview(messageImageView)
           emptyView.addSubview(messageLabel)
           
           messageImageView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
           messageImageView.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: -20).isActive = true
           messageImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
           messageImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
           
           titleLabel.topAnchor.constraint(equalTo: messageImageView.bottomAnchor, constant: 10).isActive = true
           titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
           
           messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
           messageLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
           
           messageImageView.image = messageImage
           titleLabel.text = title
           messageLabel.text = message
           messageLabel.numberOfLines = 0
           messageLabel.textAlignment = .center
           
           UIView.animate(withDuration: 1, animations: {
               
               messageImageView.transform = CGAffineTransform(rotationAngle: .pi / 10)
           }, completion: { (finish) in
               UIView.animate(withDuration: 1, animations: {
                   messageImageView.transform = CGAffineTransform(rotationAngle: -1 * (.pi / 10))
               }, completion: { (finishh) in
                   UIView.animate(withDuration: 1, animations: {
                       messageImageView.transform = CGAffineTransform.identity
                   })
               })
               
           })
           
           self.backgroundView = emptyView
           self.separatorStyle = .none
       }
       
       func restore() {
           
           self.backgroundView = nil
           self.separatorStyle = .none
           
       }
    
    
}
extension UITableViewCell {
    
    func setAnimationFromSide() {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        self.layer.transform = rotationTransform
        self.alpha = 0.5
        UIView.animate(withDuration: 1.0) {
            self.layer.transform = CATransform3DIdentity
            self.alpha = 1.0
        }
    }
    
    func setAnimationFadeIn() {
           let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 10, 0)
           self.layer.transform = rotationTransform
           self.alpha = 0.5
        UIView.animate(withDuration: 0.75) {
               self.layer.transform = CATransform3DIdentity
               self.alpha = 1.0
           }
       }
       
    
    
}
