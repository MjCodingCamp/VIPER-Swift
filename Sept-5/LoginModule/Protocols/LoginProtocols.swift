//
//  LoginProtocols.swift
//  Sept-5
//
//  Created by Mohammed Jeeshan on 07/09/21.
//

import UIKit

protocol LoginViewProtocol {
    var presenter: LoginPresenterProtocol? { get set }
}

protocol LoginPresenterProtocol {
    var view: LoginViewProtocol? { get set }
    var interactor: LoginInteractorProtocol? { get set }
    var router: LoginRouterProtocol? { get set }
    func showDetail()
    func showAlert(msg: String) -> UIAlertController
    func checkUser(userName:String, userPassword:String, completion: @escaping (Bool) -> Void)
}

protocol LoginInteractorProtocol {
    func showAlert(msg: String) -> UIAlertController
    func isUserValid(userName: String, userPassword: String, compiltion: @escaping (Bool) -> Void)
}


protocol LoginRouterProtocol {
    static func createLoginModule() -> UIViewController
    func presentHomeScreen(view: LoginViewProtocol)
}
