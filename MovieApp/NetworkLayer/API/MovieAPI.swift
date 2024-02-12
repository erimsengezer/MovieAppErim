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
}

extension MovieAPI: MTargetType {
    
    var path: String {
        switch self {
        case .getAllMovies:
            return generateEndPoint(lastPath: "/tv/popular")
        }
    }
    
    var method: MoyaMethod {
        switch self {
        case .getAllMovies:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getAllMovies:
            return .requestPlain
        }
    }
}

