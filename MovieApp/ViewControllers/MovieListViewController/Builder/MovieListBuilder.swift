//
//  MovieListBuilder.swift
//  MovieApp
//
//  Created by erimsengezer on 12.02.2024.
//  Copyright (c) 2024 All rights reserved.
// 

import UIKit
import Moya

enum MovieListBuilder {
    
    static func generate() -> UIViewController? {
        let networkManager: MoviesNetworkManager = MoviesNetworkManager(provider: MoyaProvider<MovieAPI>())
        
        let repository: MovieListRepositoryProtocol = MovieListRepository(networkManager: networkManager)
        let viewModel: MovieListViewModelProtocol = MovieListViewModel(repository: repository)

        let view: MovieListViewProtocol = MovieListViewController(viewModel: viewModel)
        
        return view as? UIViewController
    }
}
