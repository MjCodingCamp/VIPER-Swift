//
//  LoginInteractor.swift
//  Sept-5
//
//  Created by Mohammed Jeeshan on 07/09/21.
//

import FirebaseAuth

class LoginInteractor: LoginInteractorProtocol {
    let firebaseAuth = FirebaseAuth.Auth.auth()
    
    func isUserValid(userName: String, userPassword: String, compiltion: @escaping (Bool) -> Void) {
        self.firebaseAuth.signIn(withEmail: userName, password: userPassword) { AuthDataResult, error in
            if error == nil{
                compiltion(true)
            }
            else{
                compiltion(false)
            }
        }
    }
    
    func showAlert(msg: String) -> UIAlertController {
        let  alert = UIAlertController(title: "Alert Message", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        return alert
    }
}
