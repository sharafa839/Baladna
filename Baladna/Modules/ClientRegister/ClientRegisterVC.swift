//
//  ClientRegisterVC.swift
//  Baladna
//
//  Created by Ahmed on 01/11/2021.
//

import UIKit
import MaterialComponents
class ClientRegisterVC: UIViewController {
    
    
    @IBOutlet weak var createAccountLa: UILabel!
    @IBOutlet weak var FillForm: UILabel!
   
    @IBOutlet weak var fullName: MDCFilledTextField!{
        didSet{
            fullName.label.text = "FullNAme"
            fullName.setUnderlineColor(.blue, for: .normal)
            fullName.setUnderlineColor(.blue, for: .editing)
            fullName.setFilledBackgroundColor(.white, for: .normal)
            
        }
    }
    let user = RegisterViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
createUser()
        // Do any additional setup after loading the view.
    }
    func createUser(){
        user.registerAsCustomer(name: "ahmed", phone: "0111101051", password: "12211233", email: "ahmed4@gmail.com", Gender: "male")
    }


  

}
