//
//  HomeInteractor.swift
//  Sept-5
//
//  Created by Mohammed Jeeshan on 07/09/21.
//
import Foundation

class HomeInteractor: HomeInteractorProtocol {
    
    func fetchMovies(completion: @escaping ([String]) -> Void){
        var movies = [Results]()
        var moviesList = [String]()        
        if let url = URL(string: Links.moviesApi){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if data != nil{
                    if let mData = data{
                        do{
                            let dataResponse = try JSONDecoder().decode(MovieData.self, from: mData)
                            if let result = dataResponse.results{
                                for i in result{
                                    movies.append(i)
                                }
                            }
                            for poster in movies {
                                if let posterPath = poster.poster_path {
                                    moviesList.append(Links.imageLoad+(posterPath))
                                }
                            }
                            DispatchQueue.main.async {
                                completion(moviesList)
                            }
                         }catch{
                            print(error.localizedDescription)
                         }
                    }
                }
            }.resume()
        }
    }
}

