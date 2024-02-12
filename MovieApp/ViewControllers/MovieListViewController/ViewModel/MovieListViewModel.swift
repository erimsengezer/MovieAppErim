//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by erimsengezer on 12.02.2024.
//  Copyright (c) 2024 AITales IOS Development Team. All rights reserved

import Foundation

protocol MovieListViewModelProtocol: AnyObject {
    var view: MovieListViewProtocol? { get set }
}

final class MovieListViewModel: MovieListViewModelProtocol {

    // MARK: Definitions
    private let repository: MovieListRepositoryProtocol
    weak var view: MovieListViewProtocol?
    
    // MARK: Private Props

    // MARK: Public Props

    // MARK: Initiliazer
    required init(repository: MovieListRepositoryProtocol) {
        self.repository = repository
    }
}

