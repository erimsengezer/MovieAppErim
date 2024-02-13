//
//  MovieAPI.swift
//  MovieApp
//
//  Created by erimsengezer on 12.02.2024.
//

import Foundation
import Moya

enum MovieAPI {
    case getAllMovies
    case getMovieDetail(id: Int)
}

extension MovieAPI: MTargetType {
    
    var path: String {
        switch self {
        case .getAllMovies:
            return generateEndPoint(lastPath: "/tv/popular")
        case .getMovieDetail(id: let id):
            return generateEndPoint(lastPath: "/tv/\(id)")
        }
    }
    
    var method: MoyaMethod {
        switch self {
        case .getAllMovies:
            return .get
        case .getMovieDetail(id: _):
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getAllMovies:
            return .requestPlain
        case .getMovieDetail(id: _):
            return .requestPlain
        }
    }
}

