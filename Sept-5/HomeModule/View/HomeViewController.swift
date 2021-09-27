//
//  HomeViewController.swift
//  Sept-5
//
//  Created by Mohammed Jeeshan on 07/09/21.
//


import UIKit
import FirebaseAuth

class HomeViewController: UIViewController, HomeViewProtocol, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    var presenter: HomePresenterProtocol?
    var movies:[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchData(self.moviesCollectionView)
    }
    
    @IBAction func logout(_ sender: UIButton) {
        presenter?.displayLogout()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let movies = movies{
            return movies.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HomeCollectionViewCell{
            if let link = self.movies?[indexPath.row]{
                cell.movieImage.loadImage(urlString: link)
            }
            return cell
        }
        return HomeCollectionViewCell()
    }
    
}

