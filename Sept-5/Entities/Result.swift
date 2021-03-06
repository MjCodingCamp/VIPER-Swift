//
//  Result.swift
//  Sept-5
//
//  Created by Mohammed Jeeshan on 07/09/21.
//

struct Results : Codable {
    let poster_path : String?
    let adult : Bool?
    let overview : String?
    let release_date : String?
    let genre_ids : [Int]?
    let id : Int?
    let original_title : String?
    let original_language : String?
    let title : String?
    let backdrop_path : String?
    let popularity : Double?
    let vote_count : Int?
    let video : Bool?
    let vote_average : Double?
}
