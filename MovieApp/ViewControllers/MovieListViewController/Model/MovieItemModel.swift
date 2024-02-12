//
//  MovieItemModel.swift
//  MovieApp
//
//  Created by erimsengezer on 13.02.2024.
//

import Foundation

struct MovieItemModel {
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var backdropPath: String? {
        return movie.backdropPath
    }
    
    var posterPath: String? {
        return movie.posterPath
    }
    
    var originalName: String? {
        return movie.originalName
    }
    
    var id: Int {
        return movie.id
    }
}
