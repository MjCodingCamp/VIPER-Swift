//
//  LoginViewController.swift
//  Sept-5
//
//  Created by Mohammed Jeeshan on 07/09/21.
//

import UIKit

class LoginViewController: UIViewController, LoginViewProtocol {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    var presenter: LoginPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func login(_ sender: Any) {
        loginClick()
    }

    func loginClick() {
        if let userName = userName.text{
            if let password = password.text {
                presenter?.checkUser(userName: userName, userPassword: password, completion: { result in
                    if result == true{
                        self.presenter?.showDetail()
                    }
                    else{
                        if let alert = self.presenter?.showAlert(msg: "Invalid User") {
                            self.present(alert, animated: true, completion: nil)
                        }
                    }
                })
            }
        }
    }
}
