//
//  MovieDetailUIModel.swift
//  MovieApp
//
//  Created by erimsengezer on 13.02.2024.
//

import Foundation

struct MovieDetailUIModel {
    private let movieDetailModel: MovieDetailModel
    
    init(movieDetailModel: MovieDetailModel) {
        self.movieDetailModel = movieDetailModel
    }
    
    var originalName: String {
        return movieDetailModel.originalName
    }
    
    var posterPath: String {
        return movieDetailModel.posterPath
    }
    
    var overview: String {
        return movieDetailModel.overview
    }
}
