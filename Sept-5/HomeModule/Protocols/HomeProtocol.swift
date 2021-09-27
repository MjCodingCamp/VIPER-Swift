//
//  HomeProtocol.swift
//  Sept-5
//
//  Created by Mohammed Jeeshan on 07/09/21.
//

import UIKit

protocol HomeViewProtocol{
    var presenter: HomePresenterProtocol? { get set }
    var movies:[String]? { get set }
}

protocol HomePresenterProtocol{
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    func fetchData(_ collectionView: UICollectionView)
    func displayLogout()
}

protocol HomeInteractorProtocol {
    func fetchMovies(completion: @escaping ([String]) -> ())
}

protocol HomeRouterProtocol {
    static func createHomeModule() -> UIViewController
    func navigateBackLogin(view: HomeViewProtocol)
}

