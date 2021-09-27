//
//  HomePresenter.swift
//  Sept-5
//
//  Created by Mohammed Jeeshan on 07/09/21.
//

import UIKit
import FirebaseAuth

class HomePresenter: HomePresenterProtocol {
    let firebaseAuth = FirebaseAuth.Auth.auth()
    var view: HomeViewProtocol?
    var router: HomeRouterProtocol?
    var interactor: HomeInteractorProtocol?
    
    func displayLogout() {
        do{
            try self.firebaseAuth.signOut()
            if let view = view{
                router?.navigateBackLogin(view: view)
            }
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func fetchData(_ collectionView: UICollectionView) {
        interactor?.fetchMovies(completion: { (moviesList) in
            self.view?.movies = moviesList
            collectionView.reloadData()
        })
    }
}

