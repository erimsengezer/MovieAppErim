//
//  MovieModel.swift
//  MovieApp
//
//  Created by erimsengezer on 13.02.2024.
//

import Foundation

struct MovieDetailModel: Decodable {
    let originalName: String
    let posterPath: String
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case originalName = "original_name"
        case posterPath = "poster_path"
        case overview
    }
}
