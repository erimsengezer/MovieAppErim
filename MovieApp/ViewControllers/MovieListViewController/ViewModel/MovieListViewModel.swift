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
    func pushToDetailScreen(indexPath: IndexPath)
}

final class MovieListViewModel: MovieListViewModelProtocol {

    // MARK: Definitions
    private let repository: MovieListRepositoryProtocol
    weak var view: MovieListViewProtocol?
    
    // MARK: Private Props
    internal var uiModel: MoviesUIModel?

    // MARK: Initiliazer
    required init(repository: MovieListRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchAllMovies() {
        repository.fetchAllMovies { [weak self] movies in
            guard let self = self else { return }
            let uiModel: MoviesUIModel = MoviesUIModel(response: movies)
            self.uiModel = uiModel
            self.view?.update(uiModel: uiModel)
        } failure: { [weak self] error in
            self?.view?.presentAlert(title: "Error !", message: error.localizedDescription, preferredStyle: .alert)
            print(error.localizedDescription)
        }
    }
    
    func pushToDetailScreen(indexPath: IndexPath) {
        guard let movieID = uiModel?.getItemId(indexPath: indexPath) else { return }
        guard let viewController = MovieDetailBuilder.generate(movieID: movieID) else { return }
        view?.pushToDetail(viewController: viewController)
    }
}
