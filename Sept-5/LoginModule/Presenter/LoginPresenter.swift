//
//  LoginPresenter.swift
//  Sept-5
//
//  Created by Mohammed Jeeshan on 07/09/21.
//

import UIKit

class LoginPresenter: LoginPresenterProtocol {
    
    var view: LoginViewProtocol?
    var interactor: LoginInteractorProtocol?
    var router: LoginRouterProtocol?
    let todoListContext = LoginViewController()
    
    func showDetail() {
        guard let view = view else { return }
        router?.presentHomeScreen(view: view)
    }
    
    func checkUser(userName:String, userPassword:String, completion: @escaping (Bool) -> Void) {
        interactor?.isUserValid(userName: userName, userPassword: userPassword, compiltion: { res in
            completion(res)
        })
    }
    
    func showAlert(msg: String) -> UIAlertController {
        guard let res = interactor?.showAlert(msg: msg) else { fatalError("Error Found") }
        return res
    }
}
