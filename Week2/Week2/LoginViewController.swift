//
//  ViewController.swift
//  Week2
//
//  Created by Semra Karadogan on 28.05.2022.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {
    
    private var observationToken: Any?
    private let notificationCenter = NotificationCenter.default
    
    //username field
    @IBOutlet weak var username_textField: UITextField!
    
    //password field
    @IBOutlet weak var password_textField: UITextField!
    
    //Login button click
    @IBAction func login_button(_ sender: Any) {
        print("Alert! : Login button click")
    }
    
    
    //Register button click
    @IBAction func register_button(_ sender: Any) {
        print("Alert! : Register button click")
        
        if let RegisterVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController{
            navigationController?.pushViewController(RegisterVC, animated: true)
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notification()
      
    }

    // MARK: - Notification
    func notification(){
        
        let objToBeSent = "Test Message from Notification"
        NotificationCenter.default.post(name: Notification.Name("NotificationIdentifier"), object: objToBeSent)
        
    }

    // MARK: - Login Control
    func loginCheck(){
        
    }
    
   
}

