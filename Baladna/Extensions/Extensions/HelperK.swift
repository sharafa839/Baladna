//
//  HelperK.swift
//  Karam
//
//  Created by Ghoost on 1/25/20.
//  Copyright © 2020 Khalij. All rights reserved.
//

import UIKit
import NotificationBannerSwift
import CoreLocation
import MapKit
import Gallery
class HelperK: NSObject {

    class func restartApp() {
        var window: UIWindow? {
            if #available(iOS 13.0, *) {
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    return windowScene.windows.first
                }
            } else {
                return  UIApplication.shared.keyWindow
            }
            return UIWindow()
        }
        //  guard let window = UIApplication.shared.keyWindow else {return}
      //  let sb = UIStoryboard(name: "Main", bundle: nil)
      //  var vc: UIViewController
        
        if self.checkFristTime() == true {
                if self.checkUserToken() == true {
                    if self.getType() == "customer" {
                        let sb = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main")
                        window?.rootViewController = sb
                    }else if self.getType() == "driver" {
                        let sb = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "driver")
                        window?.rootViewController = sb
                    }
                }else {
                    let sb = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "login")
                    window?.rootViewController = sb
            }}
        
//        if checkUserId() == false {
//            if checkFristTime() == true {
//                vc = sb.instantiateViewController(withIdentifier: "login")
//            }else {
//                vc = sb.instantiateInitialViewController()!
//            }
//        } else {
//                vc = sb.instantiateViewController(withIdentifier: "main")
//        }
       // window?.rootViewController = vc
        UIView.transition(with: window!, duration: 0.5, options: .transitionCurlDown, animations: nil, completion: nil)
    }
    class func restartAppp() {
        var window: UIWindow? {
            if #available(iOS 13.0, *) {
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    return windowScene.windows.first
                }
            } else {
                return  UIApplication.shared.keyWindow
            }
            return UIWindow()
        }
        //  guard let window = UIApplication.shared.keyWindow else {return}
      //  let sb = UIStoryboard(name: "Main", bundle: nil)
      //  var vc: UIViewController
        
        if self.checkFristTime() == true {
                if self.checkUserToken() == true {
                   
                        let sb = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "hom")
                        window?.rootViewController = sb
            }}
        
//        if checkUserId() == false {
//            if checkFristTime() == true {
//                vc = sb.instantiateViewController(withIdentifier: "login")
//            }else {
//                vc = sb.instantiateInitialViewController()!
//            }
//        } else {
//                vc = sb.instantiateViewController(withIdentifier: "main")
//        }
       // window?.rootViewController = vc
        UIView.transition(with: window!, duration: 0.5, options: .transitionCurlDown, animations: nil, completion: nil)
    }
    class func getemail()->String{
        let def = UserDefaults.standard
        return (def.object(forKey: "email") as! String)
    }
    class func getname ()->String{
        let def = UserDefaults.standard
        return (def.object(forKey: "name") as! String)
    }
    class func getphone()->String{
        let def = UserDefaults.standard
        return (def.object(forKey: "phone") as! String)
    }
    class func getCode() -> String {
        let def = UserDefaults.standard
        return (def.object(forKey:"code") as? String ?? "")
    }
    class func saveFirstName(FName:String){
        let det = UserDefaults.standard
        det.string(forKey: "firstName")
        det.synchronize()
    }
    class func savePassword(pass:String){
        let def = UserDefaults.standard
        def.string(forKey: "Password")
    }
    class func getPassword()->String {
        let def = UserDefaults.standard
        return (def.object(forKey: "Password")as! String)
        
        }
    class func savelastName(LName:String){
        let det = UserDefaults.standard
        det.string(forKey: "lastName")
        det.synchronize()
    }
    class func getFName()->String{
        let det = UserDefaults.standard
        return (det.object(forKey: "firstName") as! String)
    }
    class func getLName()->String{
        let det = UserDefaults.standard
        return (det.object(forKey: "lastName") as! String)
    }
    class func checkLastName()->Bool{
        let def = UserDefaults.standard
         return (def.object(forKey: "lastName") as? String) != nil

    }
    class func saveToken(token: String) {
        let def = UserDefaults.standard
        def.setValue(token, forKey: "token")
        def.synchronize()
       // restartApp()
        
    }
    
    class func getUserToken() -> String {
        let def = UserDefaults.standard
        return (def.object(forKey: "token") as! String)
    }
    class func checkHaveToken(vc:UIViewController,subView:UIViewController)->Bool{
        if HelperK.checkUserToken() == true {
            return true
        }else {
            vc.view.addSubview(subView.view)

            return false
        }
    }
    
    class func checkUserToken()->Bool {
        let def = UserDefaults.standard
        return (def.object(forKey: "token") as? String) != nil
    }
    
    class func saveFristTime(token: Int) {
        let def = UserDefaults.standard
        def.setValue(token, forKey: "fTime")
        def.synchronize()
    }
    class func checkFristTime()->Bool {
        let def = UserDefaults.standard
        return (def.object(forKey: "fTime") as? Int) != nil
    }
    class func saveDate(token: String) {
        let def = UserDefaults.standard
        def.setValue(token, forKey: "datee")
        def.synchronize()
    }
    class func saveKind(token: String) {
        let def = UserDefaults.standard
        def.setValue(token, forKey: "kind")
        def.synchronize()
    }
    class func getdate()->String{
        let def = UserDefaults.standard
        return (def.object(forKey: "datee")as! String)
    }
    class func getkind()->String{
        let def = UserDefaults.standard
        return (def.object(forKey: "kind")as! String)
    }
    class func checkKind()->Bool{
        let def = UserDefaults.standard
        return (def.object(forKey: "kind")  as? String) != nil
    }
    class func checkdate()->Bool{
        let def = UserDefaults.standard
        return (def.object(forKey: "datee")  as? String) != nil
    }
    class func fetCurrentDate()->String{
       let date=Date()
    let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        return result
    }
    
    class func setUserData(phone:String,
                           name:String,
                           image:String,
                           email:String,code:String){
        
        let def = UserDefaults.standard
        def.setValue(phone, forKey: "phone")
        def.setValue(image, forKey: "image")
        def.setValue(name, forKey: "name")
        def.setValue(email, forKey: "email")
        def.setValue(code, forKey: "code")

        def.synchronize()
    }
    
    class func saveType(Type: String) {
          let def = UserDefaults.standard
          def.setValue(Type, forKey: "type")
          def.synchronize()
          self.restartApp()
      }
    
    class func getType() -> String {
        let def = UserDefaults.standard
        return (def.object(forKey: "type") as! String)
    }
    
    class func deletUserDefaults() {
        let def = UserDefaults.standard
        def.removeObject(forKey: "phone")
        def.removeObject(forKey: "image")
        def.removeObject(forKey: "name")
        def.removeObject(forKey: "type")
        def.removeObject(forKey: "email")
        def.removeObject(forKey: "token")
        
        def.synchronize()
        restartApp()
    }
    class func saveCountry(country:String){
        let def = UserDefaults.standard
        def.setValue(country, forKey: "country")
        def.synchronize()
    }
    class func saveLang(Lang:String){
        let def = UserDefaults.standard
        def.setValue(Lang,forKey: "lang")
        def.synchronize()
    }
    class func checkLang()->Bool{
        let def = UserDefaults.standard
        return (def.object(forKey: "lang") as? String) != nil
    }
    class func showWarning(title:String,subtitle: String) {
        ActivityIndicatorManager.shared.hideProgressView()
        let ss = UIImageView(image: UIImage(named: "warning"))
        let banner = FloatingNotificationBanner(title: title,subtitle: subtitle, leftView: ss , style: .warning)
        banner.show(
            cornerRadius: 8,
            shadowColor: UIColor(red: 0.431, green: 0.459, blue: 0.494, alpha: 1),
            shadowBlurRadius: 16,
            shadowEdgeInsets: UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8))
    }
    class func showError(title:String,subtitle: String) {
        ActivityIndicatorManager.shared.hideProgressView()
        let ss = UIImageView(image: UIImage(named: "error"))
        let banner = FloatingNotificationBanner(title: title,subtitle: subtitle, leftView: ss , style: .danger)
        banner.show(
            cornerRadius: 8,
            shadowColor: .clear,
            shadowBlurRadius: 16,
            shadowEdgeInsets: UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8))
    }
    
    class func showSuccess(title:String,subtitle: String) {
        ActivityIndicatorManager.shared.hideProgressView()
        let ss = UIImageView(image: UIImage(named: "success"))
        let banner = FloatingNotificationBanner(title: title,subtitle: subtitle, leftView: ss , style: .success)
        banner.show(
            cornerRadius: 8,
            shadowColor: .clear,
            //UIColor(red: 10, green: 160, blue: 110, alpha: 1),
            shadowBlurRadius: 16,
            shadowEdgeInsets: UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8))
    }
    
    
    class func statusBarBackgroundColor(colr: UIColor , view:UIView) {
        if #available(iOS 13.0, *) {
            let app = UIApplication.shared
            let statusBarHeight: CGFloat = app.statusBarFrame.size.height
            let statusbarView = UIView()
            statusbarView.backgroundColor = colr
            view.addSubview(statusbarView)
            statusbarView.translatesAutoresizingMaskIntoConstraints = false
            statusbarView.heightAnchor
                .constraint(equalToConstant: statusBarHeight).isActive = true
            statusbarView.widthAnchor
                .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
            statusbarView.topAnchor
                .constraint(equalTo: view.topAnchor).isActive = true
            statusbarView.centerXAnchor
                .constraint(equalTo: view.centerXAnchor).isActive = true
        } else {
            guard let statusBarView = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else {return}
            statusBarView.backgroundColor = colr
        }}
    
    class func getImage(vc:UIViewController) {
        
        var gallery : GalleryController!
        var arrayOfImage:[UIImage?] = []
        gallery = GalleryController()
        gallery.delegate = vc as? GalleryControllerDelegate & UINavigationControllerDelegate
            Config.tabsToShow = [.cameraTab,.imageTab]
            Config.Camera.imageLimit = 1
            vc.present(gallery,animated: true,completion: nil)
     
        }
     
    
    class func openWhatsapp(phone:String) {
           let appURL = NSURL(string: "https://api.whatsapp.com/send?phone=\(phone)")!
           if UIApplication.shared.canOpenURL(appURL as URL) {
               if #available(iOS 10.0, *) {
                   UIApplication.shared.open(appURL as URL, options: [:], completionHandler: nil)
               }else {
                   UIApplication.shared.openURL(appURL as URL)
               }}else {
               // Whatsapp is not installed
   }}
    
  
    
    //MARK:- Soical apps
    
    class func openSnapChat(username:String) {
        let appURL = URL(string: "snapchat://add/\(username)")!
        let application = UIApplication.shared
        if application.canOpenURL(appURL) {
            application.open(appURL)
        } else {
            // if Snapchat app is not installed, open URL inside Safari
            let webURL = URL(string: "https://www.snapchat.com/add/\(username)")!
            application.open(webURL)
            
        }
    }
    
    class func openFacebook(facebook: String) {
        let appURL = URL(string: "fb://profile/\(facebook)")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL) {
            application.open(appURL)
        } else {
            let webURL = URL(string: "https://facebook.com/\(facebook)")!
            application.open(webURL)
    }}
    
    class func openEmail(email:String) {
        let url = NSURL(string: "mailto:\(email)")
        UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
    }
    
    class func openTwitter(twitter:String) {
        let appURL = NSURL(string: "twitter:///user?screen_name=\(twitter)")!
        let webURL = NSURL(string: "https://twitter.com/\(twitter)")!
        if UIApplication.shared.canOpenURL(appURL as URL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appURL as URL, options: [:], completionHandler: nil)
            }else {
                UIApplication.shared.openURL(appURL as URL)
            }}else {
            UIApplication.shared.open(webURL as URL)
    }}
    
    class func openInstagram(instgram:String) {
        let appURL = URL(string: "instagram://user?username=\(instgram)")!
        let application = UIApplication.shared
        if application.canOpenURL(appURL) {
            application.open(appURL)
        } else {
            // if Instagram app is not installed, open URL inside Safari
            let webURL = URL(string: "https://instagram.com/\(instgram)")!
            application.open(webURL)
    }}
    
    class func openCalling(phone:String) {
        if let url = URL(string: "tel://\(phone)"), UIApplication.shared.canOpenURL(url) {
             UIApplication.shared.open(url)
    }}
    
    class func openMapOnAddress(long:String, lat:String, name:String) {
    //        let url = "http://maps.apple.com/maps?saddr=\(lat),\(long)"
    //        UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
            let latitude: CLLocationDegrees = Double(lat)!
            let longitude: CLLocationDegrees = Double(long)!
            let regionDistance:CLLocationDistance = 10000
            let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
            let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
                   let options = [
                       MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                       MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span) ]
                   let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
                   let mapItem = MKMapItem(placemark: placemark)
                   mapItem.name = name
                   mapItem.openInMaps(launchOptions: options)
        }
    
    
    class func setImageInNavigationBar(navigationItem:UINavigationItem  ,imgName:String) {
        let imageView = UIImageView(frame: CGRect(x: 0, y:0, width: 38, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: imgName)
        imageView.image = image
        navigationItem.titleView = imageView
    }
    
    
   class func timeConversion24(time12: String) -> String {
           let dateAsString = time12
           let df = DateFormatter()
           df.dateFormat = "hh:mm:ssa"
           let date = df.date(from: dateAsString)
           df.dateFormat = "HH:mm:ss"
           print(date)
           let time24 = df.string(from: date!)
           return time24
       }
    
    
}
