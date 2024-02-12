//
//  MovieListRepository.swift
//  MovieApp
//
//  Created by erimsengezer on 12.02.2024.
//  Copyright (c) 2024 All rights reserved.
//

import Foundation

protocol MovieListRepositoryProtocol: AnyObject {
    typealias SuccessHandler = (Movies) -> Void
    typealias FailureHandler = (Error) -> Void
    
    func fetchAllMovies(success: @escaping SuccessHandler, failure: @escaping FailureHandler)
}


final class MovieListRepository: MovieListRepositoryProtocol {
    
    let networkManager: MoviesNetworkManager
    
    init(networkManager: MoviesNetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchAllMovies(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        networkManager.getAllMovies { result in
            switch result {
            case .success(let movies):
                success(movies)
            case .failure(let error):
                failure(error)
            }
        }
    }
}
