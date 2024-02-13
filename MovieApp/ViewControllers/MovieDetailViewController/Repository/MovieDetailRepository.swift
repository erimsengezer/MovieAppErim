//
//  MovieDetailRepository.swift
//  MovieApp
//
//  Created by erimsengezer on 13.02.2024.
//  Copyright (c) 2024 All rights reserved.
//

import Foundation

protocol MovieDetailRepositoryProtocol: AnyObject {
    typealias SuccessHandler = (MovieDetailModel) -> Void
    typealias FailureHandler = (Error) -> Void
    
    func fetchMovieDetail(success: @escaping SuccessHandler, failure: @escaping FailureHandler)
}

final class MovieDetailRepository: MovieDetailRepositoryProtocol {
    private let movieID: Int
    private let networkManager: MoviesNetworkManager
    
    init(movieID: Int, networkManager: MoviesNetworkManager) {
        self.movieID = movieID
        self.networkManager = networkManager
    }
    
    func fetchMovieDetail(success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        networkManager.getMovieDetail(id: self.movieID) { result in
            switch result {
            case .success(let response):
                success(response)
            case .failure(let error):
                failure(error)
            }
        }
    }
}
