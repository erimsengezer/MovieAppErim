//
//  MovieListBuilder.swift
//  MovieApp
//
//  Created by erimsengezer on 12.02.2024.
//  Copyright (c) 2024 All rights reserved.[EC-2021]
// 

import UIKit

enum MovieListBuilder {
    
    static func generate() -> UIViewController? {
        let repository: MovieListRepositoryProtocol = MovieListRepository()
        let viewModel: MovieListViewModelProtocol = MovieListViewModel(repository: repository)

        let view: MovieListViewProtocol = MovieListViewController(viewModel: viewModel)
        
        return view as? UIViewController
    }
}
