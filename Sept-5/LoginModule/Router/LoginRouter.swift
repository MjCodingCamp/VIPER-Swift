//
//  LoginRouter.swift
//  Sept-5
//
//  Created by Mohammed Jeeshan on 07/09/21.
//

import UIKit

class LoginRouter: LoginRouterProtocol {
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createLoginModule() -> UIViewController {
        let navController = storyboard.instantiateViewController(withIdentifier: "TodoListNavigation") as! UINavigationController
        if let loginViewController = navController.topViewController as? LoginViewController {
            var presenter: LoginPresenterProtocol = LoginPresenter()
            let interactor: LoginInteractorProtocol = LoginInteractor()
            let router:LoginRouterProtocol = LoginRouter()
            loginViewController.presenter = presenter
            presenter.view = loginViewController
            presenter.interactor = interactor
            presenter.router = router
        }
        return navController
    }
    
    func presentHomeScreen(view: LoginViewProtocol) {
        let todoDetailVC = HomeRouter.createHomeModule()
        if let viewVC = view as? UIViewController {
            viewVC.navigationController?.pushViewController(todoDetailVC, animated: true)
        }
    }
}

