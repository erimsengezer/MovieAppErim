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
    
    func getItemModel(indexPath: IndexPath) -> Movie? {
        return self.response.results[indexPath.row]
    }
    
    // MARK: - Initializer
    init(response: Movies) {
        self.response = response
    }
}
