//
//  MoviesUIModel.swift
//  MovieApp
//
//  Created by erimsengezer on 13.02.2024.
//

import Foundation

struct MoviesUIModel {
    // MARK: - Private Properties
    private var response: Movies
    
    // MARK: - Public Properties
    var numberOfItems: Int? {
        return response.results.count
    }
    
    func getItemModel(indexPath: IndexPath) -> MovieItemModel? {
        let movie = self.response.results[indexPath.row]
        let movieItemModel = MovieItemModel(movie: movie)
        return movieItemModel
    }
    
    func getItemId(indexPath: IndexPath) -> Int {
        return self.response.results[indexPath.row].id
    }
    
    // MARK: - Initializer
    init(response: Movies) {
        self.response = response
    }
}
