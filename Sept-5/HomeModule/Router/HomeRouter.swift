//
//  HomeRouter.swift
//  Sept-5
//
//  Created by Mohammed Jeeshan on 07/09/21.
//

import UIKit

class HomeRouter: HomeRouterProtocol {
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func navigateBackLogin(view: HomeViewProtocol) {
        if let viewVC = view as? UIViewController {
            viewVC.navigationController?.popViewController(animated: true)
        }
    }
    
    static func createHomeModule() -> UIViewController {
        guard let todoDetailVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {
            fatalError("Jeeshan VC not Found")
        }
        var presenter: HomePresenterProtocol  = HomePresenter()
        todoDetailVC.presenter = presenter
        presenter.view = todoDetailVC
        let interactor: HomeInteractorProtocol = HomeInteractor()
        presenter.interactor = interactor
        let router: HomeRouterProtocol = HomeRouter()
        presenter.router = router
        return todoDetailVC
    }

}

