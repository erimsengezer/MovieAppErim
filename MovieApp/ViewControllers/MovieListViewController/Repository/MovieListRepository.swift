//
//  MovieListRepository.swift
//  MovieApp
//
//  Created by erimsengezer on 12.02.2024.
//  Copyright (c) 2024 All rights reserved.
//

import Foundation

protocol MovieListRepositoryProtocol: AnyObject {
    
}

final class MovieListRepository: MovieListRepositoryProtocol {
    
    let networkManager: MoviesNetworkManager
    
    init(networkManager: MoviesNetworkManager) {
        self.networkManager = networkManager
    }
}
