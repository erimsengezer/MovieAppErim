//
//  MoviesNetworkManager.swift
//  MovieApp
//
//  Created by erimsengezer on 12.02.2024.
//

import Foundation
import Moya

protocol MoviesNetworkManagerProtocol {
    func getAllMovies(completion: @escaping (Result<Movies, Error>) -> ())
}

class MoviesNetworkManager: BaseManager<MovieAPI, MoyaProvider<MovieAPI>>, MoviesNetworkManagerProtocol {
    
    override init(provider: MoyaProvider<MovieAPI>) {
        super.init(provider: provider)
    }

    func getAllMovies(completion: @escaping (Result<Movies, Error>) -> ()) {
        request(target: .getAllMovies, completion: completion)
    }
}

struct Movies: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let id: Int
    let original_name: String
}
