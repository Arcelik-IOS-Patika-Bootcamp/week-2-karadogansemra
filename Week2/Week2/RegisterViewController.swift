//
//  RegisterViewController.swift
//  Week2
//
//  Created by Semra Karadogan on 31.05.2022.
//

import UIKit
import Foundation

class RegisterViewController: UIViewController, UITextFieldDelegate {

    //name textfield
    @IBOutlet weak var reg_name_textField: UITextField!
    
    //surname textfield
    @IBOutlet weak var reg_surname_textField: UITextField!
    
    //email textfield
    @IBOutlet weak var reg_email_textField: UITextField!
    
    //username textfield
    @IBOutlet weak var reg_username_textField: UITextField!
    
    //password textfield
    @IBOutlet weak var reg_password_textField: UITextField!
    
    // MARK: - Register Click
    
    // Create account button click
    @IBAction func reg_account_button(_ sender: Any) {
        
        print("Alert! : Create account button click")
        
        if(isValidationField()){
            
            if let LoginVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController{
                navigationController?.pushViewController(LoginVC, animated: true)
            }
            
        }else{
            print("Validation Error!")
        }
    }
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

        reg_name_textField.delegate = self
        reg_surname_textField.delegate = self
        reg_email_textField.delegate = self
        reg_username_textField.delegate = self
        reg_password_textField.delegate = self
        
        notificationObserver()
        
        
    }
    
    
    // MARK: - Notification
    
    func notificationObserver()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name("NotificationIdentifier"), object: nil)
    }
    
    @objc func methodOfReceivedNotification(notification: Notification) {
            print("Value of notification : ", notification.object ?? "")
    
    }

    // MARK: - Validation
    
    func isValidationField() -> Bool{
        
        let validation = Validation()
        
        let isValidName: Bool = validation.isValid(name: reg_name_textField.text ?? "")
        let isValidSurname: Bool = validation.isValid(name: reg_surname_textField.text ?? "")
        let isValidEmail: Bool = validation.isValid(email: reg_email_textField.text ?? "")
        let isValidUsername: Bool = validation.isValidUsername(Username: reg_username_textField.text ?? "")
        let isValidPassword: Bool = validation.isValidPassword(password: reg_password_textField.text ?? "")
        
        if(!isValidName){
            reg_name_textField.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 3, revert: true)
        }
        
        if(!isValidSurname){
            reg_surname_textField.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 3, revert: true)
        }
        
        if(!isValidEmail){
            reg_email_textField.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 3, revert: true)
        }
        
        if(!isValidUsername){
            reg_username_textField.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 3, revert: true)
        }
        
        if(!isValidPassword){
            reg_password_textField.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 3, revert: true)
        }
        
        if(isValidName && isValidSurname && isValidEmail && isValidEmail && isValidUsername && isValidPassword){
            return true
        }
        
       return false
    }
  
}

extension UITextField {
    func isError(baseColor: CGColor, numberOfShakes shakes: Float, revert: Bool) {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "shadowColor")
        animation.fromValue = baseColor
        animation.toValue = UIColor.red.cgColor
        animation.duration = 0.4
        if revert { animation.autoreverses = true } else { animation.autoreverses = false }
        self.layer.add(animation, forKey: "")

        let shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 0.07
        shake.repeatCount = shakes
        if revert { shake.autoreverses = true  } else { shake.autoreverses = false }
        shake.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        shake.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(shake, forKey: "position")
    }
    

}
