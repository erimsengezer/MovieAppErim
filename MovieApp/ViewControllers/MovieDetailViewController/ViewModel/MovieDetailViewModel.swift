//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by erimsengezer on 13.02.2024.
//  Copyright (c) 2024 All rights reserved.
//

import Foundation

protocol MovieDetailViewModelProtocol: AnyObject {
    var view: MovieDetailViewProtocol? { get set }
    
    func fetchMovieDetail()
}

final class MovieDetailViewModel: MovieDetailViewModelProtocol {

    // MARK: Definitions
    private let repository: MovieDetailRepositoryProtocol
    weak var view: MovieDetailViewProtocol?
    
    // MARK: Private Props

    // MARK: Public Props

    // MARK: Initiliazer
    required init(repository: MovieDetailRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchMovieDetail() {
        repository.fetchMovieDetail { [weak self] responseModel in
            guard let self = self else { return }
            let uiModel = MovieDetailUIModel(movieDetailModel: responseModel)
            self.view?.updateUI(uiModel: uiModel)
            self.view?.hideLoading()
        } failure: { [weak self] error in
            guard let self = self else { return }
            Logger.log(error.localizedDescription, level: .error)
            self.view?.presentAlert(title: "Error !", message: error.localizedDescription, preferredStyle: .alert)
            self.view?.hideLoading()
        }

    }
}
