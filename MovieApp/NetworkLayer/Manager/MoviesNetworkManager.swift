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
    
    func getMovieDetail(id: Int, completion: @escaping (Result<MovieDetailModel, Error>) -> ()) {
        request(target: .getMovieDetail(id: id), completion: completion)
    }
}
