//
//  MovieDetailBuilder.swift
//  MovieApp
//
//  Created by erimsengezer on 13.02.2024.
//  Copyright (c) 2024 All rights reserved.
// 

import UIKit
import Moya

enum MovieDetailBuilder {
    
    static func generate(movieID: Int) -> UIViewController? {
        let networkManager: MoviesNetworkManager = MoviesNetworkManager(provider: MoyaProvider<MovieAPI>())
        
        let repository: MovieDetailRepositoryProtocol = MovieDetailRepository(movieID: movieID, networkManager: networkManager)
        let viewModel: MovieDetailViewModelProtocol = MovieDetailViewModel(repository: repository)

        let view: MovieDetailViewProtocol = MovieDetailViewController(viewModel: viewModel)
        viewModel.view = view
        
        return view as? UIViewController
    }
}
