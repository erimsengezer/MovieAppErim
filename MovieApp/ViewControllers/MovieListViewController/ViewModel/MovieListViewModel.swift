//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by erimsengezer on 12.02.2024.
//  Copyright (c) 2024 All rights reserved.
//

import Foundation

protocol MovieListViewModelProtocol: AnyObject {
    var view: MovieListViewProtocol? { get set }
    
    func fetchAllMovies()
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
    
    func fetchAllMovies() {
        repository.fetchAllMovies { [weak self] movies in
            guard let self = self else { return }
            let uiModel: MoviesUIModel = MoviesUIModel(response: movies)
            self.view?.update(uiModel: uiModel)
        } failure: { error in
            print(error.localizedDescription)
        }

    }
}

struct MoviesUIModel {
    // MARK: - Private Properties
    private var response: Movies
    
    // MARK: - Public Properties
    var numberOfItems: Int? {
        return response.results.count
    }
    
    func getItemModel(indexPath: IndexPath) -> Movie? {
        return self.response.results[indexPath.row]
    }
    
    // MARK: - Initializer
    init(response: Movies) {
        self.response = response
    }
}
