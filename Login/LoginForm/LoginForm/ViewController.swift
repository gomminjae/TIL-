//
//  ViewController.swift
//  LoginForm
//
//  Created by Apple on 2020/01/22.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    
    var emailErrorHeight: NSLayoutConstraint?
    var passwordErrorHeight: NSLayoutConstraint?
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //textField 값이 변경되는걸 캐치
        emailTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        emailErrorHeight = emailError.heightAnchor.constraint(equalToConstant: 0)
        passwordErrorHeight = passwordError.heightAnchor.constraint(equalToConstant: 0)
    }
    
    @objc func textFieldEdited(textField: UITextField) {
        
        if textField == emailTextField {
           // print("email \(textField.text!)")
            if isValidEmail(email: textField.text) == true {
                emailErrorHeight?.isActive = true
               
            }else {
                emailErrorHeight?.isActive = false
            }
        }else if textField == passwordTextField {
            //print("password \(textField.text!)")
            if isValidPassword(password: textField.text) == true {
                passwordErrorHeight?.isActive = true
            }else {
                passwordErrorHeight?.isActive = false
            }
        }
        UIView.animate(withDuration: 0.1) {
            self.view.layoutIfNeeded()
        }
    }
    
    //이메일 유효검사
    //정규식 - regular expression
    func isValidEmail(email: String?) -> Bool {
        
        guard email != nil else { return false}
        
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let pred = NSPredicate(format: "SELF MATCHES %@", regEx)
        
        return pred.evaluate(with: email)
    }
    
    func isValidPassword(password: String?) -> Bool {
        if let hasPassword = password {
            if hasPassword.count < 8 {
                return false
            }
       }
         return true
    }
    
    
    
    


}

