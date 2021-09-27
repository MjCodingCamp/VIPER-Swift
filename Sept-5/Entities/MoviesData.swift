//
//  MoviesData.swift
//  Sept-5
//
//  Created by Mohammed Jeeshan on 07/09/21.
//

struct MovieData : Codable {
    let page : Int?
    let results : [Results]?
    let total_results : Int?
    let total_pages : Int?
}
